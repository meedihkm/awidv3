# Optimisations SQL - Sprint 2.2

## 🚀 Résumé des Améliorations

Ce document détaille les optimisations de performance appliquées à la base de données PostgreSQL pour éliminer les goulots d'étranglement (N+1) et accélérer les requêtes fréquentes.

### 1. Élimination du Problème N+1

#### Avant (Boucle N+1)
Pour lister 50 commandes, le serveur exécutait :
1.  Une requête pour récupérer les 50 commandes.
2.  Une boucle de 50 requêtes pour récupérer les items de chaque commande.
**Total : 51 requêtes SQL.**

#### Après (Agrégation JSON)
Nous utilisons `json_agg` et `JOIN` pour tout récupérer en une seule passe.
**Total : 1 requête SQL.**

```sql
SELECT o.*, 
    COALESCE(
      json_agg(json_build_object('id', oi.id, ...)) 
      FILTER (WHERE oi.id IS NOT NULL), '[]'
    ) as items
FROM orders o 
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id
```

### 2. Indexation Stratégique (`003_add_indexes.sql`)

| Table | Colonnes | Type | Usage |
|---|---|---|---|
| `orders` | `(organization_id, created_at DESC)` | B-Tree | Tri par défaut du dashboard |
| `orders` | `(status)` | Partial | Filtre rapide des commandes en cours (`active`) |
| `deliveries` | `(deliverer_id, status)` | B-Tree | Filtrage des livraisons par livreur |
| `audit_logs` | `(organization_id, created_at DESC)` | B-Tree | Historique d'activités |

### 3. Connection Pooling (`pg-pool`)

Configuration optimisée pour éviter la saturation des connexions :
- **Max Connections**: 20 (suffisant pour gérer ~1000 req/s avec des requêtes rapides)
- **Idle Timeout**: 30s (fermeture agressive des connexions inutilisées)
- **Connection Timeout**: 2s (fail-fast si la DB est surchargée)

### 4. Prepared Statements

Les requêtes les plus fréquentes (findUserByEmail, findOrderById) sont définies dans `api-v2/queries/prepared-statements.js` pour permettre à PostgreSQL de cacher leur plan d'exécution.

## 📊 Impact Estimé
- **Latence `/api/orders`** : Réduction de ~60% (de 150ms à 60ms pour 50 items).
- **Latence `/api/deliveries`** : Réduction massive grâce à l'élimination des sous-requêtes profondes.
- **Charge CPU DB** : Réduite de moitié grâce à la diminution du nombre de round-trips.
