/**
 * Pagination Helper
 * Standardise la gestion de la pagination pour l'API
 */

/**
 * Extrait les paramètres de pagination de la requête
 * @param {Object} query - req.query
 * @param {number} defaultLimit - Limite par défaut (def: 20)
 * @param {number} maxLimit - Limite maximum (def: 100)
 * @returns {Object} { page, limit, offset }
 */
const getPagination = (query, defaultLimit = 20, maxLimit = 100) => {
    const page = Math.max(1, parseInt(query.page, 10) || 1);
    const limit = Math.min(
        Math.max(1, parseInt(query.limit, 10) || defaultLimit),
        maxLimit
    );
    const offset = (page - 1) * limit;

    return { page, limit, offset };
};

/**
 * Formate la réponse avec les données et les métadonnées de pagination
 * @param {Array} data - Les données de la page courante
 * @param {number} total - Nombre total d'éléments
 * @param {number} page - Numéro de page courant
 * @param {number} limit - Limite par page
 * @returns {Object} { success: true, data, pagination: { ... } }
 */
const getPagingData = (data, total, page, limit) => {
    const totalItems = parseInt(total, 10);
    const totalPages = Math.max(1, Math.ceil(totalItems / limit));

    return {
        success: true,
        data,
        pagination: {
            page,
            limit,
            total: totalItems,
            totalPages,
            hasMore: page < totalPages,
            hasPrev: page > 1
        }
    };
};

module.exports = {
    getPagination,
    getPagingData
};
