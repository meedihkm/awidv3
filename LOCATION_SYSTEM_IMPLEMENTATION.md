# Système de Localisation et Historique GPS

## 📍 Vue d'ensemble

Système complet de tracking GPS des livreurs avec mise à jour automatique des adresses clients lors de la livraison.

## ✅ Fonctionnalités Implémentées

### 1. Historique GPS des Livreurs
- **Table `location_history`**: Stockage de toutes les positions GPS
- **Champs**: latitude, longitude, accuracy, timestamp, deliverer_id, organization_id
- **Index optimisés**: Par livreur, par date, par organisation
- **Contraintes**: Validation des coordonnées GPS (-90/90, -180/180)

### 2. Mise à Jour Automatique des Adresses Clients
- **Trigger automatique**: Lors du passage à statut `delivered`
- **Condition**: Seulement si le client n'a pas encore d'adresse GPS
- **Source**: Position actuelle du livreur au moment de la livraison
- **Audit**: Log automatique de la mise à jour dans `audit_logs`

### 3. Statistiques de Localisation
- **Fonction `get_deliverer_location_stats()`**:
  - Nombre total de points GPS par jour
  - Première et dernière position
  - Durée totale de tracking
  - Précision moyenne du GPS

### 4. Nettoyage Automatique
- **Fonction `cleanup_old_location_history()`**:
  - Supprime l'historique de plus de X jours (défaut: 90 jours)
  - Optimise la taille de la base de données
  - Peut être appelé manuellement ou via cron

## 🔧 Backend (Node.js)

### Routes Ajoutées/Modifiées

#### `POST /api/realtime/location`
```javascript
// Livreur met à jour sa position
{
  "latitude": 36.7167,
  "longitude": 4.0500,
  "accuracy": 15.5  // Nouveau: précision en mètres
}
```

#### `GET /api/realtime/deliverer/:id/history?date=2026-01-19`
```javascript
// Historique GPS d'un livreur pour une date
// Retourne: [{latitude, longitude, accuracy, recorded_at}]
```

#### `GET /api/realtime/deliverer/:id/stats?startDate=2026-01-01&endDate=2026-01-19`
```javascript
// Statistiques de localisation
// Retourne: [{date, total_points, first_location, last_location, duration_hours, avg_accuracy}]
```

#### `POST /api/realtime/cleanup-history`
```javascript
// Nettoyer l'historique ancien (Admin uniquement)
{
  "daysToKeep": 90  // Optionnel, défaut: 90
}
// Retourne: {success, deletedCount}
```

### Validation (Zod)
```javascript
updateLocation: z.object({
  latitude: z.number().min(-90).max(90),
  longitude: z.number().min(-180).max(180),
  accuracy: z.number().min(0).optional().nullable()
})
```

## 📱 Frontend (Flutter)

### Service de Localisation Modifié

**Fichier**: `mobile/lib/core/services/location_service.dart`

```dart
// Envoie maintenant l'accuracy au serveur
await _apiService.updateDelivererLocation(
  position.latitude, 
  position.longitude,
  position.accuracy  // Nouveau
);
```

### API Service Modifié

**Fichier**: `mobile/lib/core/services/api_service.dart`

```dart
Future<Map<String, dynamic>> updateDelivererLocation(
  double lat, 
  double lng, 
  [double? accuracy]  // Nouveau paramètre optionnel
) async => _request('POST', '${ApiConstants.baseUrl}/realtime/location', body: {
  'latitude': lat, 
  'longitude': lng,
  if (accuracy != null) 'accuracy': accuracy
});
```

## 🔄 Flux de Mise à Jour Automatique

```
1. Livreur livre commande
   ↓
2. Statut delivery → 'delivered'
   ↓
3. Trigger: trigger_update_client_address_on_delivery
   ↓
4. Vérification: Client a-t-il déjà une adresse GPS?
   ↓ NON
5. Récupération position actuelle du livreur
   ↓
6. Mise à jour users.address_lat et users.address_lng du client
   ↓
7. Log dans audit_logs (action: 'auto_update_client_location')
```

## 📊 Schéma de la Table

```sql
CREATE TABLE location_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  deliverer_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  organization_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  accuracy DOUBLE PRECISION,
  recorded_at TIMESTAMP DEFAULT NOW(),
  
  CONSTRAINT valid_latitude CHECK (latitude >= -90 AND latitude <= 90),
  CONSTRAINT valid_longitude CHECK (longitude >= -180 AND longitude <= 180),
  CONSTRAINT valid_accuracy CHECK (accuracy IS NULL OR accuracy >= 0)
);
```

## 🎯 Cas d'Usage

### 1. Tracking en Temps Réel
- Admin voit positions des livreurs sur la carte
- Historique complet des déplacements
- Analyse des itinéraires

### 2. Optimisation des Livraisons
- Statistiques de durée de livraison
- Analyse des zones couvertes
- Identification des problèmes de GPS

### 3. Adresses Clients Automatiques
- Plus besoin de saisir manuellement les adresses
- Précision GPS garantie
- Historique des mises à jour dans audit_logs

### 4. Maintenance de la Base
- Nettoyage automatique de l'historique ancien
- Optimisation de l'espace disque
- Performance maintenue

## 🔒 Sécurité

- **Authentification**: Toutes les routes nécessitent un token JWT
- **Autorisation**: 
  - Livreurs: Peuvent seulement mettre à jour leur propre position
  - Admins: Peuvent voir historique et stats de tous les livreurs
- **Isolation**: Filtrage par `organization_id` sur toutes les requêtes
- **Validation**: Contraintes sur les coordonnées GPS

## 📝 Migration SQL

**Fichier**: `sql_location_system.sql`

**Ordre d'exécution**:
1. `fix_organization_isolation.sql`
2. `sql_payment_system.sql`
3. `sql_favorite_orders_system.sql`
4. `sql_notifications_system.sql`
5. **`sql_location_system.sql`** ← NOUVEAU

## 🧪 Tests Recommandés

1. **Test de tracking**:
   - Livreur active le tracking
   - Vérifier insertion dans `location_history`
   - Vérifier accuracy est enregistrée

2. **Test de mise à jour automatique**:
   - Client sans adresse GPS
   - Livreur livre la commande
   - Vérifier `users.address_lat/lng` du client mis à jour
   - Vérifier log dans `audit_logs`

3. **Test de statistiques**:
   - Appeler `/api/realtime/deliverer/:id/stats`
   - Vérifier calculs corrects

4. **Test de nettoyage**:
   - Insérer données anciennes
   - Appeler `/api/realtime/cleanup-history`
   - Vérifier suppression

## 📈 Améliorations Futures Possibles

- [ ] Notification au client quand son adresse est mise à jour
- [ ] Visualisation de l'historique GPS sur la carte admin
- [ ] Calcul automatique de la distance parcourue
- [ ] Détection des zones de livraison fréquentes
- [ ] Export des données GPS pour analyse externe
- [ ] Optimisation des itinéraires basée sur l'historique

## 🐛 Gestion des Erreurs

- **Table inexistante**: Le code gère gracieusement si `location_history` n'existe pas encore
- **GPS désactivé**: Le service Flutter vérifie les permissions avant tracking
- **Précision faible**: L'accuracy est optionnelle, peut être NULL
- **Données anciennes**: Fonction de nettoyage pour éviter surcharge

## ✅ Checklist de Déploiement

- [x] SQL: Créer `sql_location_system.sql`
- [x] Backend: Modifier `api-v2/routes/realtime.routes.js`
- [x] Backend: Ajouter validation `accuracy` dans `api-v2/schemas/validation.js`
- [x] Frontend: Modifier `mobile/lib/core/services/location_service.dart`
- [x] Frontend: Modifier `mobile/lib/core/services/api_service.dart`
- [ ] Base de données: Exécuter `sql_location_system.sql` sur Supabase
- [ ] Tests: Vérifier tracking et mise à jour automatique
- [ ] Git: Commit et push des changements
- [ ] Vercel: Vérifier déploiement automatique du backend
