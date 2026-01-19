# 🚀 Guide de Déploiement - Version 2.0.0

**Date**: 19 Janvier 2026  
**Version**: 2.0.0 - Phases 1, 2 et 3 complètes  
**Status**: Production Ready

---

## 🎯 Nouveautés Version 2.0

### ✅ Phase 1: Gestion des Dettes
- Système complet paiements/dettes
- Distribution automatique intelligente
- Historique transparent
- Stats temps réel

### ✅ Phase 2: Commande Habituelle
- Détection automatique patterns
- Favoris 1-clic
- Suggestions intelligentes
- Paramètres personnalisables

### ✅ Phase 3: Notifications
- Notifications automatiques
- Badge temps réel
- Rappels dette optionnels
- Préférences granulaires

---

## 📋 Prérequis

- ✅ Compte GitHub avec accès repo
- ✅ Compte Vercel connecté
- ✅ Compte Supabase actif
- ✅ Flutter SDK (pour mobile)
- ✅ Git installé

---

## 🗄️ ÉTAPE 1: Migrations SQL (CRITIQUE)

### ⚠️ ORDRE OBLIGATOIRE

Exécuter dans Supabase **dans cet ordre exact**:

#### 1. fix_organization_isolation.sql
```sql
-- Corrige isolation données
-- Ajoute CASCADE DELETE
-- Durée: ~30 secondes
```

#### 2. sql_payment_system.sql
```sql
-- Système paiements/dettes
-- Tables: payment_transactions, client_debts_view
-- Fonctions: apply_payment_to_client, get_client_debt_details
-- Durée: ~1 minute
```

#### 3. sql_favorite_orders_system.sql
```sql
-- Système favoris
-- Tables: favorite_orders, client_order_patterns, user_preferences
-- Fonctions: detect_order_pattern, create_favorite_from_pattern
-- Durée: ~1 minute
```

#### 4. sql_notifications_system.sql
```sql
-- Système notifications
-- Tables: notifications, notification_preferences
-- Fonctions: create_notification, notify_payment_recorded
-- Triggers: trigger_notify_payment
-- Durée: ~1 minute
```

### Procédure

1. Ouvrir Supabase Dashboard
2. SQL Editor > New Query
3. Copier contenu fichier 1
4. Run
5. Vérifier succès
6. Répéter pour fichiers 2, 3, 4

### Vérification

Dans Table Editor, vérifier:
- ✅ payment_transactions
- ✅ favorite_orders
- ✅ notifications
- ✅ client_debts_view (vue)
- ✅ notification_preferences

---

## 🚀 ÉTAPE 2: Push GitHub

```bash
# Vérifier statut
git status

# Ajouter fichiers
git add .

# Commit
git commit -F COMMIT_MESSAGE_ALL_PHASES.txt

# Push
git push origin main
```

Vercel déploie automatiquement après push.

---

## ✅ ÉTAPE 3: Vérification Backend

### Health Check

```bash
curl https://app-livraison.vercel.app/api/health
```

Réponse attendue:
```json
{
  "status": "ok",
  "version": "2.0.0",
  "timestamp": "..."
}
```

### Test Routes

```bash
# Paiements
curl https://app-livraison.vercel.app/api/payments/stats

# Favoris
curl https://app-livraison.vercel.app/api/favorites/my-favorites

# Notifications
curl https://app-livraison.vercel.app/api/notifications/unread-count
```

---

## 📱 ÉTAPE 4: Build Mobile

### Android

```bash
cd mobile
flutter clean
flutter pub get
flutter build apk --release
```

APK: `mobile/build/app/outputs/flutter-apk/app-release.apk`

### iOS (Mac)

```bash
cd mobile
flutter clean
flutter pub get
flutter build ios --release
```

---

## 🧪 ÉTAPE 5: Tests Fonctionnels

### Test 1: Paiements ✅

1. Login Admin
2. Finance > Dettes
3. Cliquer "Paiement" sur client
4. Enregistrer paiement 1000 DA
5. ✅ Notification créée
6. ✅ Dette mise à jour
7. ✅ Historique visible

### Test 2: Favoris ✅

1. Login Client
2. Commander 3x mêmes articles
3. ✅ Suggestion favori apparaît
4. Créer favori "Menu matin"
5. ✅ Bouton "Favoris (1)" visible
6. Utiliser favori
7. ✅ Panier rempli instantanément

### Test 3: Notifications ✅

1. ✅ Badge cloche avec compteur
2. Cliquer badge
3. ✅ Liste notifications
4. Swipe to delete
5. ✅ Notification supprimée
6. Marquer toutes lues
7. ✅ Compteur à 0

### Test 4: Paramètres ✅

1. Paramètres
2. Désactiver notif paiements
3. Sauvegarder
4. Faire paiement
5. ✅ Aucune notification
6. Réactiver
7. ✅ Notifications reviennent

---

## 🔧 Variables d'Environnement

### Vercel

```env
DATABASE_URL=postgresql://...
JWT_SECRET=...
JWT_REFRESH_SECRET=...
NODE_ENV=production
```

### Flutter

`mobile/lib/core/constants/api_constants.dart`:
```dart
static const String baseUrl = 'https://app-livraison.vercel.app/api';
```

---

## 📊 Monitoring

### Vercel
- Dashboard > Logs
- Surveiller erreurs 500
- Vérifier temps réponse

### Supabase
- Dashboard > Logs
- Surveiller queries lentes
- Vérifier connexions

---

## 🐛 Troubleshooting

### "Table does not exist"
**Cause**: Migrations non exécutées  
**Solution**: Exécuter les 4 migrations dans l'ordre

### "Function does not exist"
**Cause**: Migration incomplète  
**Solution**: Vérifier toutes les fonctions créées

### Notifications absentes
**Cause**: Trigger non créé ou préférences désactivées  
**Solution**: 
1. Vérifier `trigger_notify_payment` existe
2. Vérifier préférences utilisateur

### Favoris ne se créent pas
**Cause**: Table ou fonction manquante  
**Solution**:
1. Vérifier `favorite_orders` existe
2. Vérifier `detect_order_pattern` existe

### Badge notifications ne rafraîchit pas
**Cause**: Service non initialisé  
**Solution**: Redémarrer app Flutter

---

## ✅ Checklist Déploiement

### Base de Données
- [ ] Migration 1: fix_organization_isolation.sql
- [ ] Migration 2: sql_payment_system.sql
- [ ] Migration 3: sql_favorite_orders_system.sql
- [ ] Migration 4: sql_notifications_system.sql
- [ ] Tables vérifiées
- [ ] Fonctions vérifiées
- [ ] Triggers vérifiés

### Backend
- [ ] Code pushé GitHub
- [ ] Vercel déployé
- [ ] Health check OK
- [ ] Variables env configurées
- [ ] Logs sans erreurs

### Frontend
- [ ] APK Android généré
- [ ] IPA iOS généré (si applicable)
- [ ] API URL configurée
- [ ] Tests manuels OK

### Tests Fonctionnels
- [ ] Test paiements
- [ ] Test favoris
- [ ] Test notifications
- [ ] Test paramètres
- [ ] Test badge temps réel

---

## 🎉 Déploiement Réussi!

Si tous les tests passent:

**✅ Version 2.0.0 en Production**

- Backend: https://app-livraison.vercel.app
- Base de données: Supabase
- Mobile: APK/IPA générés

---

## 📞 Support

Problèmes? Vérifier dans l'ordre:

1. Logs Vercel
2. Logs Supabase
3. Migrations SQL
4. Variables environnement
5. Version Flutter

---

## 📈 Prochaines Étapes

Après déploiement réussi:

1. Distribuer APK aux utilisateurs
2. Former les admins
3. Monitorer logs 24h
4. Collecter feedback
5. Planifier améliorations

---

**Dernière mise à jour**: 19 Janvier 2026  
**Auteur**: Kiro AI  
**Status**: ✅ Production Ready
