# 📖 Guide Utilisateur - Awid

Bienvenue dans le guide utilisateur de l'application de livraison Awid. Ce document explique comment utiliser les fonctionnalités clés selon votre rôle.

## 👥 Rôles et Accès

| Rôle | Description | Accès |
|------|-------------|-------|
| **Admin** | Gère le restaurant, les menus, et les utilisateurs. | Back-office Web |
| **Cafétéria** (Client) | Passe les commandes pour les employés. | App Mobile / Web |
| **Livreur** | Livre les commandes et scanne les preuves. | App Mobile |
| **Cuisine** | Prépare les commandes (Mode "Kitchen Display"). | Back-office Web (Mode Cuisine) |

---

## 🚀 Pour Commencer

1.  **Connexion**
    *   Ouvrez l'application ou le site web.
    *   Entrez votre email et mot de passe (fournis par votre administrateur).
    *   *Note: Si vous êtes Admin, vous pouvez créer d'autres comptes.*

---

## 📦 Gestion des Commandes (Cafétéria)

### Passer une commande
1.  Connectez-vous en tant que **Cafétéria**.
2.  Accédez à l'onglet **"Nouvelle Commande"**.
3.  Sélectionnez les produits dans la liste.
4.  Validez le panier.
5.  *Statut initial : `En attente`.*

### Suivre une commande
*   Allez dans **"Mes Commandes"**.
*   Codes couleurs :
    *   🟡 **En attente** : Commande reçue.
    *   🔵 **Validée** : Confirmée par le restaurant.
    *   🟠 **En préparation** : La cuisine s'active !
    *   🚚 **En cours de livraison** : Le livreur est en route.
    *   ✅ **Livrée** : Bon appétit !

---

## 🍳 Gestion Cuisine & Restaurant (Admin/Cuisine)

### Valider les commandes
1.  Connectez-vous au Dashboard Admin.
2.  Allez dans **"Commandes Entrantes"**.
3.  Cliquez sur **"Valider"** pour envoyer la commande en cuisine.
    *   *Optionnel : Utilisez le mode "Automatique" si activé.*

### Écran de Cuisine (KDS)
1.  Ouvrez la vue **"Cuisine"**.
2.  Les commandes `Validées` s'affichent par ordre de priorité.
3.  Cliquez sur **"Commencer Préparation"** (Statut -> `Preparing`).
4.  Une fois prête, cliquez sur **"Prête"** (Statut -> `Ready`).

### Assigner un livreur
1.  Pour une commande `Prête` ou `Verrouillée`.
2.  Cliquez sur **"Assigner"**.
3.  Sélectionnez un livreur disponible dans la liste.

---

## 🛵 Espace Livreur

### Ma Feuille de Route
1.  Connectez-vous sur l'App Mobile.
2.  L'onglet **"Route"** affiche vos missions du jour.
3.  Les commandes sont triées par priorité et distance.

### Effectuer une livraison
1.  **Accepter** : Cliquez sur la commande pour voir les détails.
2.  **Démarrer** : Glissez le bouton vers "En cours".
3.  **Navigation** : Cliquez sur l'adresse pour ouvrir GPS/Waze.
4.  **Sur place** :
    *   Demandez au client (Cafétéria) son **QR Code**.
    *   Scannez le QR Code avec l'app.
    *   OU Validez manuellement si besoin (Code PIN ou Signature).
5.  **Terminer** : La commande passe en `Livrée`.

### Gestion des Problèmes
*   **Client Absent / Fermé** : Cliquez sur "Signaler un problème" -> "Reporter" ou "Échec".
*   **Paiement** : Si paiement à la livraison, encaissez le montant et validez "Payé".

---

## 🔧 Administration (Super-User)

### Gérer les Utilisateurs
*   Menu **"Utilisateurs"** -> **"Ajouter"**.
*   Rôles disponibles : `Livreur`, `Cafétéria`.
*   Vous pouvez désactiver un compte ( ex: Livreur parti) sans supprimer l'historique.

### Audit & Logs
*   Chaque action sensible (suppression, modification de prix) est enregistrée.
*   Accédez à **"Logs"** pour voir l'historique de sécurité.

---

## 🆘 Support

En cas de problème technique :
1.  Essayez de **rafraîchir** l'application (Pull-to-refresh).
2.  Vérifiez votre connexion internet.
3.  Contactez l'équipe technique : `support@awid.com`.
