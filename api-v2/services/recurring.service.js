/**
 * Recurring Orders Service
 * Gestion des commandes récurrentes automatiques
 */

const pool = require("../config/database");
const logger = require("../config/logger");

/**
 * Crée une nouvelle commande récurrente
 */
async function createRecurringOrder(data) {
  const client = await pool.connect();

  try {
    await client.query("BEGIN");

    const {
      organizationId,
      customerId,
      name,
      frequency,
      dayOfWeek,
      dayOfMonth,
      timeOfDay,
      items,
    } = data;

    // Calculer la prochaine génération
    const nextGeneration = calculateNextGeneration({
      frequency,
      dayOfWeek,
      dayOfMonth,
      timeOfDay,
    });

    // Insérer le template
    const result = await client.query(
      `INSERT INTO recurring_orders 
       (organization_id, customer_id, name, frequency, day_of_week, day_of_month, time_of_day, next_generation_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
       RETURNING *`,
      [
        organizationId,
        customerId,
        name,
        frequency,
        dayOfWeek || null,
        dayOfMonth || null,
        timeOfDay || "06:00:00",
        nextGeneration,
      ],
    );

    const recurringOrder = result.rows[0];

    // Insérer les items
    if (items && items.length > 0) {
      for (const item of items) {
        await client.query(
          `INSERT INTO recurring_order_items (recurring_order_id, product_id, quantity)
           VALUES ($1, $2, $3)`,
          [recurringOrder.id, item.productId, item.quantity],
        );
      }
    }

    await client.query("COMMIT");

    logger.info(
      `Recurring order created: ${recurringOrder.id} for customer ${customerId}`,
    );
    return formatRecurringOrder(recurringOrder);
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
}

/**
 * Met à jour une commande récurrente
 */
async function updateRecurringOrder(id, organizationId, data) {
  const client = await pool.connect();

  try {
    await client.query("BEGIN");

    const { name, frequency, dayOfWeek, dayOfMonth, timeOfDay, items, active } =
      data;

    // Recalculer next_generation si paramètres changés
    let nextGeneration = null;
    if (
      frequency ||
      dayOfWeek !== undefined ||
      dayOfMonth !== undefined ||
      timeOfDay
    ) {
      // Récupérer les valeurs actuelles si non fournies
      const current = await client.query(
        `SELECT frequency, day_of_week, day_of_month, time_of_day FROM recurring_orders WHERE id = $1::text AND organization_id = $2::text`,
        [id, organizationId],
      );
      if (current.rows.length === 0) {
        await client.query("ROLLBACK");
        return null;
      }

      const merged = {
        frequency: frequency || current.rows[0].frequency,
        dayOfWeek:
          dayOfWeek !== undefined ? dayOfWeek : current.rows[0].day_of_week,
        dayOfMonth:
          dayOfMonth !== undefined ? dayOfMonth : current.rows[0].day_of_month,
        timeOfDay: timeOfDay || current.rows[0].time_of_day,
      };
      nextGeneration = calculateNextGeneration(merged);
    }

    // Construire la requête UPDATE dynamiquement
    const updates = [];
    const params = [id, organizationId];
    let paramCount = 2;

    if (name !== undefined) {
      paramCount++;
      updates.push(`name = $${paramCount}`);
      params.push(name);
    }
    if (frequency !== undefined) {
      paramCount++;
      updates.push(`frequency = $${paramCount}`);
      params.push(frequency);
    }
    if (dayOfWeek !== undefined) {
      paramCount++;
      updates.push(`day_of_week = $${paramCount}`);
      params.push(dayOfWeek);
    }
    if (dayOfMonth !== undefined) {
      paramCount++;
      updates.push(`day_of_month = $${paramCount}`);
      params.push(dayOfMonth);
    }
    if (timeOfDay !== undefined) {
      paramCount++;
      updates.push(`time_of_day = $${paramCount}`);
      params.push(timeOfDay);
    }
    if (active !== undefined) {
      paramCount++;
      updates.push(`active = $${paramCount}`);
      params.push(active);
    }
    if (nextGeneration) {
      paramCount++;
      updates.push(`next_generation_at = $${paramCount}`);
      params.push(nextGeneration);
    }

    updates.push("updated_at = NOW()");

    const result = await client.query(
      `UPDATE recurring_orders SET ${updates.join(", ")} WHERE id = $1::text AND organization_id = $2::text RETURNING *`,
      params,
    );

    if (result.rows.length === 0) {
      await client.query("ROLLBACK");
      return null;
    }

    // Mettre à jour les items si fournis
    if (items !== undefined) {
      // Supprimer les anciens items
      await client.query(
        `DELETE FROM recurring_order_items WHERE recurring_order_id = $1`,
        [id],
      );

      // Ajouter les nouveaux
      for (const item of items) {
        await client.query(
          `INSERT INTO recurring_order_items (recurring_order_id, product_id, quantity)
           VALUES ($1, $2, $3)`,
          [id, item.productId, item.quantity],
        );
      }
    }

    await client.query("COMMIT");
    return formatRecurringOrder(result.rows[0]);
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
}

/**
 * Supprime une commande récurrente
 */
async function deleteRecurringOrder(id, organizationId) {
  const result = await pool.query(
    `DELETE FROM recurring_orders WHERE id = $1::text AND organization_id = $2::text RETURNING id`,
    [id, organizationId],
  );
  return result.rows.length > 0;
}

/**
 * Liste les commandes récurrentes d'une cafétéria
 */
async function getRecurringOrders(customerId, organizationId) {
  console.log("🔍 getRecurringOrders called - VERSION WITH ::text CAST");
  const result = await pool.query(
    `SELECT ro.*, 
       (SELECT json_agg(json_build_object(
         'id', roi.id,
         'productId', roi.product_id,
         'productName', p.name,
         'quantity', roi.quantity
       )) FROM recurring_order_items roi 
       JOIN products p ON roi.product_id = p.id
       WHERE roi.recurring_order_id = ro.id) as items
     FROM recurring_orders ro
     WHERE ro.customer_id::text = $1::text AND ro.organization_id::text = $2::text
     ORDER BY ro.created_at DESC`,
    [customerId, organizationId],
  );

  return result.rows.map(formatRecurringOrder);
}

/**
 * Récupère une commande récurrente par ID
 */
async function getRecurringOrderById(id, organizationId) {
  const result = await pool.query(
    `SELECT ro.*, 
       (SELECT json_agg(json_build_object(
         'id', roi.id,
         'productId', roi.product_id,
         'productName', p.name,
         'quantity', roi.quantity
       )) FROM recurring_order_items roi 
       JOIN products p ON roi.product_id::text = p.id::text
       WHERE roi.recurring_order_id = ro.id) as items
     FROM recurring_orders ro
     WHERE ro.id = $1::text AND ro.organization_id = $2::text`,
    [id, organizationId],
  );

  return result.rows[0] ? formatRecurringOrder(result.rows[0]) : null;
}

/**
 * Pause/Resume une commande récurrente
 */
async function toggleRecurringOrder(id, organizationId) {
  const result = await pool.query(
    `UPDATE recurring_orders 
     SET active = NOT active, updated_at = NOW()
     WHERE id = $1::text AND organization_id = $2::text
     RETURNING *`,
    [id, organizationId],
  );
  return result.rows[0] ? formatRecurringOrder(result.rows[0]) : null;
}

/**
 * Admin: Liste toutes les commandes récurrentes
 */
async function getAllRecurringOrders(organizationId, options = {}) {
  const { active } = options;

  let query = `
    SELECT ro.*, u.name as customer_name,
      (SELECT COUNT(*) FROM recurring_order_items WHERE recurring_order_id = ro.id) as items_count
    FROM recurring_orders ro
    JOIN users u ON ro.customer_id = u.id
    WHERE ro.organization_id = $1::text
  `;
  const params = [organizationId];

  if (active !== undefined) {
    params.push(active);
    query += ` AND ro.active = $${params.length}`;
  }

  query += " ORDER BY ro.next_generation_at ASC NULLS LAST";

  const result = await pool.query(query, params);
  return result.rows.map((row) => ({
    ...formatRecurringOrder(row),
    customerName: row.customer_name,
    itemsCount: parseInt(row.items_count) || 0,
  }));
}

/**
 * CRON: Traite les commandes récurrentes dues
 */
async function processRecurringOrders() {
  const client = await pool.connect();

  try {
    // Récupérer les commandes à générer
    const dueOrders = await client.query(
      `SELECT ro.*, 
         (SELECT json_agg(json_build_object(
           'productId', roi.product_id,
           'quantity', roi.quantity
         )) FROM recurring_order_items roi WHERE roi.recurring_order_id = ro.id) as items
       FROM recurring_orders ro
       WHERE ro.active = true AND ro.next_generation_at <= NOW()
       FOR UPDATE SKIP LOCKED`,
    );

    logger.info(`Processing ${dueOrders.rows.length} recurring orders`);

    const generatedOrders = [];

    for (const recurringOrder of dueOrders.rows) {
      await client.query("BEGIN");

      try {
        const items = recurringOrder.items || [];
        if (items.length === 0) {
          logger.warn(
            `Recurring order ${recurringOrder.id} has no items, skipping`,
          );
          continue;
        }

        // Calculer le total
        let total = 0;
        for (const item of items) {
          const productResult = await client.query(
            `SELECT price FROM products WHERE id = $1`,
            [item.productId],
          );
          if (productResult.rows[0]) {
            total += parseFloat(productResult.rows[0].price) * item.quantity;
          }
        }

        // Créer la commande
        const orderResult = await client.query(
          `INSERT INTO orders (organization_id, customer_id, date, total, status, payment_status)
           VALUES ($1, $2, CURRENT_DATE, $3, 'pending', 'unpaid')
           RETURNING *`,
          [recurringOrder.organization_id, recurringOrder.customer_id, total],
        );

        const newOrder = orderResult.rows[0];

        // Créer les order_items
        for (const item of items) {
          const productResult = await client.query(
            `SELECT price FROM products WHERE id = $1`,
            [item.productId],
          );
          const price = productResult.rows[0]
            ? parseFloat(productResult.rows[0].price)
            : 0;

          await client.query(
            `INSERT INTO order_items (order_id, product_id, quantity, price)
             VALUES ($1, $2, $3, $4)`,
            [newOrder.id, item.productId, item.quantity, price],
          );
        }

        // Mettre à jour le recurring_order
        const nextGeneration = calculateNextGeneration({
          frequency: recurringOrder.frequency,
          dayOfWeek: recurringOrder.day_of_week,
          dayOfMonth: recurringOrder.day_of_month,
          timeOfDay: recurringOrder.time_of_day,
        });

        await client.query(
          `UPDATE recurring_orders 
           SET last_generated_at = NOW(), next_generation_at = $2, updated_at = NOW()
           WHERE id = $1`,
          [recurringOrder.id, nextGeneration],
        );

        await client.query("COMMIT");

        generatedOrders.push({
          recurringOrderId: recurringOrder.id,
          orderId: newOrder.id,
          customerId: recurringOrder.customer_id,
          total,
        });

        logger.info(
          `Generated order ${newOrder.id} from recurring ${recurringOrder.id}`,
        );
      } catch (error) {
        await client.query("ROLLBACK");
        logger.error(
          `Error processing recurring order ${recurringOrder.id}:`,
          error,
        );
      }
    }

    return generatedOrders;
  } finally {
    client.release();
  }
}

/**
 * Calcule la prochaine date de génération
 */
function calculateNextGeneration({
  frequency,
  dayOfWeek,
  dayOfMonth,
  timeOfDay,
}) {
  const now = new Date();
  const [hours, minutes] = (timeOfDay || "06:00:00").split(":").map(Number);

  let next = new Date();
  next.setHours(hours, minutes, 0, 0);

  switch (frequency) {
    case "daily":
      // Si l'heure est passée aujourd'hui, passer à demain
      if (next <= now) {
        next.setDate(next.getDate() + 1);
      }
      break;

    case "weekly":
      // Trouver le prochain jour de la semaine
      const targetDay =
        dayOfWeek !== null && dayOfWeek !== undefined ? dayOfWeek : 1; // Default Monday
      const currentDay = next.getDay();
      let daysUntil = targetDay - currentDay;
      if (daysUntil < 0 || (daysUntil === 0 && next <= now)) {
        daysUntil += 7;
      }
      next.setDate(next.getDate() + daysUntil);
      break;

    case "monthly":
      // Trouver le prochain jour du mois
      const targetDate = dayOfMonth || 1;
      next.setDate(targetDate);
      if (next <= now) {
        next.setMonth(next.getMonth() + 1);
      }
      // Gérer les mois avec moins de jours
      if (next.getDate() !== targetDate) {
        next.setDate(0); // Dernier jour du mois précédent
      }
      break;
  }

  return next;
}

// ===== Helpers =====

function formatRecurringOrder(row) {
  return {
    id: row.id,
    organizationId: row.organization_id,
    customerId: row.customer_id,
    name: row.name,
    frequency: row.frequency,
    dayOfWeek: row.day_of_week,
    dayOfMonth: row.day_of_month,
    timeOfDay: row.time_of_day,
    active: row.active,
    lastGeneratedAt: row.last_generated_at,
    nextGenerationAt: row.next_generation_at,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
    items: row.items || [],
  };
}

module.exports = {
  createRecurringOrder,
  updateRecurringOrder,
  deleteRecurringOrder,
  getRecurringOrders,
  getRecurringOrderById,
  toggleRecurringOrder,
  getAllRecurringOrders,
  processRecurringOrders,
  calculateNextGeneration,
};
