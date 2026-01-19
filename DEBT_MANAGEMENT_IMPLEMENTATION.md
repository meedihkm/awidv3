# 💰 Implémentation Système de Gestion des Dettes

**Date**: 19 Janvier 2026  
**Status**: Backend Complété ✅ | Frontend En Cours 🚧

---

## 📋 Vue d'Ensemble

Système complet de gestion des dettes permettant:
- ✅ Enregistrement des paiements par Admin et Livreur
- ✅ Répartition automatique ou manuelle sur les commandes
- ✅ Historique complet des transactions
- ✅ Transparence totale pour les clients
- ✅ Statistiques en temps réel

---

## 🗄️ Backend - Complété ✅

### 1. Migration SQL (`sql_payment_system.sql`)

**Table `payment_transactions`:**
- Enregistre tous les paiements
- Champs: amount, payment_type, payment_mode, delivery_id, target_orders, etc.
- Index optimisés pour performance

**Vue `client_debts_view`:**
- Vue matérialisée des dettes par client
- Calculs automatiques: total_debt, unpaid_orders_count, etc.

**Fonction `apply_payment_to_client()`:**
- Logique intelligente de répartition des paiements
- Supporte mode automatique et manuel
- Gère les paiements lors de livraison
- Retourne détails complets de la transaction

**Fonction `get_client_debt_details()`:**
- Retourne tous les détails de dette d'un client
- Inclut historique des paiements
- Format JSON optimisé pour l'API

### 2. Routes API (`api-v2/routes/payments.routes.js`)

#### POST `/api/payments/record`
Enregistrer un paiement (Admin ou Livreur)

**Body:**
```json
{
  "clientId": "uuid",
  "amount": 5000,
  "mode": "auto",
  "deliveryId": "uuid",
  "targetOrders": ["uuid1", "uuid2"],
  "notes": "Paiement en espèces"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "transaction_id": "uuid",
    "amount_applied": 5000,
    "payment_mode": "auto",
    "orders_affected": [
      {
        "order_id": "uuid",
        "order_number": 125,
        "amount_applied": 2000,
        "previous_status": "unpaid",
        "new_status": "paid"
      }
    ],
    "debt_before": 5000,
    "debt_after": 0,
    "debt_cleared": true
  }
}
```

#### GET `/api/payments/client/:clientId/details`
Détails de dette d'un client (Admin)

**Response:**
```json
{
  "success": true,
  "data": {
    "client": {
      "id": "uuid",
      "name": "Cafétéria A",
      "email": "client@example.com",
      "phone": "0123456789"
    },
    "total_debt": 3000,
    "unpaid_orders": [
      {
        "id": "uuid",
        "order_number": 123,
        "date": "2026-01-15T10:00:00Z",
        "total": 1500,
        "amount_paid": 0,
        "remaining": 1500,
        "payment_status": "unpaid"
      }
    ],
    "payment_history": [
      {
        "id": "uuid",
        "date": "2026-01-19T14:30:00Z",
        "amount": 2000,
        "payment_type": "delivery",
        "payment_mode": "auto",
        "orders_affected": [...],
        "recorded_by": {
          "id": "uuid",
          "name": "Mohamed",
          "role": "deliverer"
        },
        "notes": null
      }
    ]
  }
}
```

#### GET `/api/payments/history`
Historique de tous les paiements (Admin uniquement)

**Query Params:** `page`, `limit`

#### GET `/api/payments/my-collections`
Historique des collectes du livreur connecté

#### GET `/api/payments/my-payments`
Historique des paiements du client connecté

#### GET `/api/payments/stats`
Statistiques des paiements (Admin uniquement)

**Response:**
```json
{
  "success": true,
  "data": {
    "total_collected_today": 15000,
    "payments_count_today": 8,
    "total_collected_month": 120000,
    "clients_paid_today": 5
  }
}
```

### 3. Validation (`api-v2/schemas/validation.js`)

Schema `recordPayment` ajouté avec validation Zod complète.

### 4. Intégration (`api-v2/index.js`)

Routes montées sur `/api/payments/*`

---

## 📱 Frontend Flutter - À Implémenter 🚧

### Fichiers à Créer/Modifier:

#### 1. **Service API** (`mobile/lib/core/services/api_service.dart`)
Ajouter méthodes:
- `recordPayment()`
- `getClientDebtDetails()`
- `getPaymentHistory()`
- `getMyPayments()`
- `getPaymentStats()`

#### 2. **Page Admin - Détails Client** (`mobile/lib/features/admin/presentation/pages/client_detail_page.dart`)
- Afficher dette totale
- Liste des commandes impayées
- Bouton "Enregistrer paiement"
- Dialog avec mode auto/manuel
- Historique des paiements

#### 3. **Page Livreur - Livraison** (`mobile/lib/features/deliverer/presentation/pages/delivery_detail_page.dart`)
- Champ "Montant collecté"
- Affichage dette + montant commande
- Mode auto/manuel optionnel
- Confirmation avec répartition

#### 4. **Page Livreur - Dashboard** (`mobile/lib/features/deliverer/presentation/pages/deliverer_dashboard.dart`)
- Section "Clients avec dettes"
- Bouton "Collecter dette" sans livraison
- Historique des collectes du jour

#### 5. **Page Client - Historique** (`mobile/lib/features/cafeteria/presentation/pages/order_history_page.dart`)
- Tab "Commandes" (existant)
- Tab "Finance" (nouveau)
  * Dette actuelle
  * Historique des paiements
  * Détails par transaction

#### 6. **Page Admin - Finance** (`mobile/lib/features/admin/presentation/pages/financial_page.dart`)
- Nouvelles stats: Collecté aujourd'hui, Ce mois
- Amélioration onglet "Dettes"
- Bouton "Enregistrer paiement" par client

---

## 🔄 Flux Utilisateur

### Scénario 1: Livreur collecte lors de livraison
```
1. Livreur ouvre delivery_detail_page
2. Sélectionne "Livrée"
3. Saisit montant collecté: 5000 DA
4. Voit: Dette 3000 + Commande 2000 = Total 5000 DA
5. Valide
6. API: apply_payment_to_client()
7. Confirmation avec répartition affichée
8. Notification → Admin + Client
```

### Scénario 2: Admin enregistre paiement
```
1. Admin ouvre financial_page > Dettes
2. Clique sur client avec dette
3. Ouvre client_detail_page
4. Clique "Enregistrer paiement"
5. Dialog: Montant + Mode (auto/manuel)
6. Si manuel: Sélectionne commandes
7. Valide
8. API: apply_payment_to_client()
9. Confirmation + Notification client
```

### Scénario 3: Client consulte ses paiements
```
1. Client ouvre order_history_page
2. Tab "Finance"
3. Voit: Dette actuelle + Historique
4. Clique sur transaction → Détails
5. Voit quelles commandes ont été payées
```

---

## 📊 Données de Test

### Créer des données de test:
```sql
-- Client avec dette
INSERT INTO orders (organization_id, cafeteria_id, date, total, status, payment_status, amount_paid, order_number)
VALUES ('org-id', 'client-id', NOW() - INTERVAL '5 days', 1500, 'delivered', 'unpaid', 0, 120);

INSERT INTO orders (organization_id, cafeteria_id, date, total, status, payment_status, amount_paid, order_number)
VALUES ('org-id', 'client-id', NOW() - INTERVAL '3 days', 1500, 'delivered', 'unpaid', 0, 121);

-- Tester paiement
SELECT apply_payment_to_client(
  'client-id'::UUID,
  2000::DECIMAL,
  'org-id'::TEXT,
  'admin-id'::UUID,
  'admin'::VARCHAR,
  'auto'::VARCHAR,
  NULL,
  NULL,
  'Test paiement'::TEXT
);

-- Vérifier résultat
SELECT * FROM payment_transactions WHERE client_id = 'client-id';
SELECT * FROM orders WHERE cafeteria_id = 'client-id';
```

---

## ✅ Checklist Déploiement

### Backend:
- [x] Migration SQL créée
- [x] Routes API créées
- [x] Validation ajoutée
- [x] Routes montées dans index.js
- [ ] Migration SQL exécutée sur Supabase
- [ ] Tests API avec Postman/Insomnia
- [ ] Code pushé sur GitHub

### Frontend:
- [ ] Service API étendu
- [ ] Page client_detail_page modifiée
- [ ] Page delivery_detail_page modifiée
- [ ] Page deliverer_dashboard modifiée
- [ ] Page order_history_page modifiée (tab Finance)
- [ ] Page financial_page améliorée
- [ ] Tests sur émulateur
- [ ] Build et test sur device

### Documentation:
- [x] Documentation technique
- [ ] Guide utilisateur Admin
- [ ] Guide utilisateur Livreur
- [ ] Guide utilisateur Client

---

## 🚀 Prochaines Étapes

1. **Exécuter `sql_payment_system.sql` sur Supabase**
2. **Tester les routes API**
3. **Implémenter le frontend Flutter**
4. **Tests end-to-end**
5. **Déploiement**

---

**Auteur**: Kiro AI Assistant  
**Version**: 1.0  
**Status**: Backend Ready ✅
