# Database Migrations

Ce dossier contient toutes les migrations SQL pour la base de données PostgreSQL.

## 📋 Liste des Migrations

1. **001_create_organizations.sql** - Table des organisations
2. **002_create_users.sql** - Table des utilisateurs (admin, kitchen, deliverer, customer)
3. **003_create_products.sql** - Table des produits et prix personnalisés
4. **004_create_orders.sql** - Tables des commandes et lignes de commande
5. **005_create_deliveries.sql** - Tables des livraisons et tracking GPS
6. **006_create_payments.sql** - Tables des paiements et allocations
7. **007_create_packaging.sql** - Tables des consignes (emballages réutilisables)
8. **008_create_stock.sql** - Tables des mouvements de stock et alertes
9. **009_create_notifications.sql** - Tables des notifications et audit logs
10. **010_create_indexes_and_views.sql** - Index supplémentaires et vues matérialisées

## 🚀 Exécution des Migrations

### Exécuter toutes les migrations en attente

```bash
npm run migrate:up
```

### Voir le statut des migrations

```bash
npm run migrate:status
```

## 📊 Vues Matérialisées

Les vues matérialisées sont créées pour optimiser les requêtes de rapports:

- **daily_organization_stats** - Statistiques quotidiennes par organisation
- **customer_debt_aging** - Vieillissement des créances par client
- **deliverer_performance** - Performance des livreurs
- **top_selling_products** - Produits les plus vendus

### Rafraîchir les vues matérialisées

```sql
-- Toutes les vues
SELECT refresh_all_materialized_views();

-- Uniquement les statistiques quotidiennes
SELECT refresh_daily_stats();
```

## 🔧 Fonctionnalités Automatiques

### Triggers

- **updated_at** - Mise à jour automatique du timestamp sur toutes les tables
- **generate_order_number** - Génération automatique des numéros de commande (ORD-000001)
- **generate_delivery_number** - Génération automatique des numéros de livraison (DEL-000001)
- **generate_payment_number** - Génération automatique des numéros de paiement (PAY-000001)
- **update_customer_debt** - Mise à jour automatique de la dette client
- **update_order_status_from_delivery** - Synchronisation statut commande/livraison
- **update_order_payment_status** - Mise à jour automatique du statut de paiement
- **update_packaging_balance** - Mise à jour automatique du solde de consignes
- **record_stock_movement** - Enregistrement automatique des mouvements de stock
- **create_low_stock_alert** - Création automatique des alertes de stock bas

### Contraintes

- **Soft delete** - Toutes les tables principales utilisent `deleted_at` au lieu de suppression physique
- **Foreign keys** - Relations strictes entre les tables avec CASCADE ou RESTRICT
- **Check constraints** - Validation des valeurs (statuts, montants positifs, etc.)
- **Unique constraints** - Unicité des emails, numéros de commande, etc.

## 🗄️ Structure de la Base de Données

```
organizations (organisations)
├── users (utilisateurs)
│   ├── orders (commandes)
│   │   ├── order_items (lignes de commande)
│   │   ├── deliveries (livraisons)
│   │   │   └── delivery_tracking (tracking GPS)
│   │   └── payment_allocations (allocations de paiement)
│   ├── payments (paiements)
│   ├── packaging_movements (mouvements de consignes)
│   └── packaging_balances (soldes de consignes)
├── products (produits)
│   ├── product_custom_prices (prix personnalisés)
│   ├── stock_movements (mouvements de stock)
│   └── stock_alerts (alertes de stock)
├── packaging_types (types de consignes)
├── notifications (notifications)
├── audit_logs (logs d'audit)
└── user_sessions (sessions utilisateur)
```

## 📝 Notes Importantes

1. **Montants en centimes** - Tous les montants sont stockés en centimes (DZD) pour éviter les problèmes de précision
2. **Timestamps avec timezone** - Tous les timestamps incluent le timezone
3. **Soft delete** - Les suppressions sont logiques (deleted_at) pour conserver l'historique
4. **Audit trail** - Toutes les actions importantes sont loggées dans audit_logs
5. **Performance** - Index optimisés pour les requêtes fréquentes
6. **Sécurité** - Contraintes strictes et validation au niveau base de données

## 🔄 Maintenance

### Nettoyage automatique

Des fonctions de nettoyage sont disponibles:

```sql
-- Nettoyer les anciennes notifications
SELECT cleanup_old_notifications();

-- Nettoyer les sessions expirées
SELECT cleanup_expired_sessions();

-- Nettoyer les anciens logs d'audit
SELECT cleanup_old_audit_logs();
```

### Recommandations

- Rafraîchir les vues matérialisées quotidiennement (cron job)
- Exécuter les fonctions de nettoyage hebdomadairement
- Sauvegarder la base de données quotidiennement
- Monitorer la taille des tables et index

## 🐛 Dépannage

### Migration échoue

```bash
# Vérifier le statut
npm run migrate:status

# Vérifier les logs PostgreSQL
tail -f /var/log/postgresql/postgresql-*.log
```

### Rollback manuel

Si une migration échoue, vous pouvez la rollback manuellement:

```sql
-- Supprimer la migration de la table
DELETE FROM migrations WHERE id = X;

-- Supprimer les objets créés par la migration
DROP TABLE IF EXISTS table_name CASCADE;
```

## 📚 Ressources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL Triggers](https://www.postgresql.org/docs/current/triggers.html)
- [PostgreSQL Materialized Views](https://www.postgresql.org/docs/current/rules-materializedviews.html)
