# 📱 Frontend Flutter - Gestion des Dettes - Progression

**Date**: 19 Janvier 2026  
**Status**: En Cours 🚧

---

## ✅ Complété

### 1. Services
- ✅ `mobile/lib/core/services/payment_service.dart` - Service dédié aux paiements
- ✅ `mobile/lib/core/services/api_service.dart` - Méthodes API ajoutées:
  * `recordPayment()` - Enregistrer un paiement
  * `getClientDebtDetails()` - Détails dette client
  * `getPaymentHistory()` - Historique admin
  * `getMyCollections()` - Collectes livreur
  * `getMyPayments()` - Paiements client
  * `getPaymentStats()` - Statistiques

### 2. Widgets
- ✅ `mobile/lib/features/admin/presentation/widgets/record_payment_dialog.dart`
  * Dialog complet pour enregistrer un paiement
  * Mode automatique et manuel
  * Sélection des commandes
  * Affichage du résultat avec répartition
  * Gestion des erreurs

---

## 🚧 À Implémenter

### 3. Page Admin - Détails Client
**Fichier**: `mobile/lib/features/admin/presentation/pages/client_detail_page.dart`

**Modifications nécessaires:**
```dart
// Ajouter:
- Section dette totale en haut
- Liste des commandes impayées (expandable)
- Bouton "Enregistrer paiement" → RecordPaymentDialog
- Onglet "Historique des paiements"
- Afficher les transactions avec détails
```

### 4. Page Livreur - Détail Livraison
**Fichier**: `mobile/lib/features/deliverer/presentation/pages/delivery_detail_page.dart`

**Modifications nécessaires:**
```dart
// Dans le formulaire de livraison:
- Afficher dette actuelle du client
- Afficher montant de la commande
- Afficher total à collecter
- Champ "Montant collecté"
- Option mode auto/manuel (optionnel)
- Appeler recordPayment() avec deliveryId
- Afficher résultat de la répartition
```

### 5. Page Livreur - Dashboard
**Fichier**: `mobile/lib/features/deliverer/presentation/pages/deliverer_dashboard.dart`

**Ajouts nécessaires:**
```dart
// Nouvelle section:
- "Clients avec dettes" (liste)
- Pour chaque client: nom + dette
- Bouton "Collecter dette"
- Dialog simple: montant + notes
- Appeler recordPayment() sans deliveryId
- Section "Mes collectes du jour"
```

### 6. Page Client - Historique
**Fichier**: `mobile/lib/features/cafeteria/presentation/pages/order_history_page.dart`

**Modifications nécessaires:**
```dart
// Ajouter TabBar avec 2 tabs:
Tab 1: "Commandes" (existant)
  - Liste des commandes
  - Expandable pour voir détails
  - Afficher statut paiement

Tab 2: "Finance" (nouveau)
  - Card: Dette actuelle
  - Card: Commandes impayées (count)
  - Liste: Historique des paiements
  - Pour chaque paiement:
    * Date + montant
    * Collecté par (nom + rôle)
    * Commandes affectées
```

### 7. Page Admin - Finance
**Fichier**: `mobile/lib/features/admin/presentation/pages/financial_page.dart`

**Améliorations nécessaires:**
```dart
// Dans l'onglet "Dettes":
- Bouton "Enregistrer paiement" par client
- Ouvrir RecordPaymentDialog
- Rafraîchir après paiement

// Nouvelles stats en haut:
- Card: "Collecté aujourd'hui"
- Card: "Collecté ce mois"
- Card: "Clients payés aujourd'hui"
```

---

## 📝 Code Snippets Utiles

### Appeler RecordPaymentDialog (Admin)
```dart
import '../widgets/record_payment_dialog.dart';

// Dans un bouton:
onPressed: () async {
  // Récupérer les détails du client
  final details = await _paymentService.getClientDebtDetails(clientId);
  final clientData = details['data'];
  
  showDialog(
    context: context,
    builder: (context) => RecordPaymentDialog(
      client: clientData['client'],
      totalDebt: (clientData['total_debt'] ?? 0).toDouble(),
      unpaidOrders: clientData['unpaid_orders'],
      onSuccess: () {
        // Rafraîchir les données
        _loadData(forceRefresh: true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Paiement enregistré avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      },
    ),
  );
}
```

### Enregistrer paiement lors de livraison (Livreur)
```dart
// Dans delivery_detail_page.dart
final amountCollected = double.tryParse(_amountController.text) ?? 0;

if (amountCollected > 0) {
  try {
    final result = await _paymentService.recordPayment(
      clientId: delivery['order']['cafeteria']['id'],
      amount: amountCollected,
      mode: 'auto', // ou 'manual' si option activée
      deliveryId: delivery['id'],
      notes: 'Collecté lors de la livraison',
    );
    
    // Afficher le résultat
    _showPaymentResult(result['data']);
  } catch (e) {
    // Gérer l'erreur
  }
}
```

### Afficher historique paiements (Client)
```dart
// Dans order_history_page.dart
Future<void> _loadPayments() async {
  try {
    final result = await _paymentService.getMyPayments();
    final data = result['data'];
    
    setState(() {
      _totalDebt = (data['total_debt'] ?? 0).toDouble();
      _paymentHistory = data['payment_history'] ?? [];
    });
  } catch (e) {
    // Gérer l'erreur
  }
}

// Afficher dans la liste:
ListView.builder(
  itemCount: _paymentHistory.length,
  itemBuilder: (context, index) {
    final payment = _paymentHistory[index];
    return Card(
      child: ListTile(
        leading: Icon(Icons.payment, color: Colors.green),
        title: Text('${payment['amount']} DA'),
        subtitle: Text(
          '${payment['date']}\n'
          'Par: ${payment['recorded_by']['name']} (${payment['recorded_by']['role']})'
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () => _showPaymentDetails(payment),
      ),
    );
  },
)
```

---

## 🎯 Ordre d'Implémentation Recommandé

1. **Page Admin - Détails Client** (Priorité 1)
   - Permet à l'admin d'enregistrer des paiements
   - Utilise le RecordPaymentDialog déjà créé

2. **Page Livreur - Détail Livraison** (Priorité 1)
   - Permet au livreur de collecter lors de livraison
   - Cas d'usage le plus fréquent

3. **Page Client - Historique Finance** (Priorité 2)
   - Transparence pour le client
   - Consultation uniquement

4. **Page Livreur - Dashboard** (Priorité 2)
   - Collecte de dette sans livraison
   - Cas d'usage moins fréquent

5. **Page Admin - Finance Stats** (Priorité 3)
   - Amélioration visuelle
   - Statistiques supplémentaires

---

## 🧪 Tests à Effectuer

### Scénario 1: Admin enregistre paiement
1. Ouvrir page détails client
2. Cliquer "Enregistrer paiement"
3. Saisir montant
4. Mode auto: Valider
5. Vérifier répartition affichée
6. Vérifier dette mise à jour

### Scénario 2: Livreur collecte lors livraison
1. Ouvrir détail livraison
2. Sélectionner "Livrée"
3. Saisir montant collecté
4. Valider
5. Vérifier paiement enregistré
6. Vérifier notification admin

### Scénario 3: Client consulte historique
1. Ouvrir historique
2. Tab "Finance"
3. Voir dette actuelle
4. Voir liste des paiements
5. Cliquer sur un paiement
6. Voir détails

---

## 📊 Estimation Temps

- Page Admin - Détails Client: 2-3 heures
- Page Livreur - Détail Livraison: 2-3 heures
- Page Client - Historique Finance: 2 heures
- Page Livreur - Dashboard: 1-2 heures
- Page Admin - Finance Stats: 1 heure
- Tests et corrections: 2 heures

**Total estimé: 10-13 heures**

---

## 🚀 Prochaine Étape

**Commencer par**: Page Admin - Détails Client

**Raison**: C'est la fonctionnalité la plus critique et elle utilise déjà le RecordPaymentDialog créé.

---

**Voulez-vous que je continue avec l'implémentation de la page Admin - Détails Client?** 🚀
