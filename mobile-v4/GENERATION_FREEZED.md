# Génération des Fichiers Freezed

## Problème

Les fichiers `.freezed.dart` et `.g.dart` ne sont pas versionnés dans Git car ils sont générés automatiquement. Ils doivent être créés avant de pouvoir compiler l'application.

## Solution Rapide

### Option 1: Script Automatique (Recommandé)

Double-cliquez sur le fichier `generate_freezed.bat` dans le dossier `mobile-v4`.

### Option 2: Ligne de Commande

```cmd
cd mobile-v4
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" pub get
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" pub run build_runner build --delete-conflicting-outputs
```

### Option 3: Flutter dans le PATH

Si Flutter est dans votre PATH:

```cmd
cd mobile-v4
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Fichiers Générés

Cette commande va créer environ 100+ fichiers:
- `*.freezed.dart` - Classes immutables avec copyWith, equality, etc.
- `*.g.dart` - Sérialisation JSON (fromJson, toJson)

## Durée

- Première génération: 2-5 minutes
- Régénération: 30 secondes - 2 minutes

## Après la Génération

Une fois les fichiers générés, vous pouvez:

1. **Compiler l'APK**:
   ```cmd
   flutter build apk --release
   ```

2. **Lancer en mode debug**:
   ```cmd
   flutter run
   ```

3. **Vérifier les erreurs**:
   ```cmd
   flutter analyze
   ```

## Quand Régénérer?

Régénérez les fichiers après avoir modifié:
- Une classe avec `@freezed`
- Une classe avec `@JsonSerializable`
- Ajout/suppression de propriétés dans les entités

## Erreurs Courantes

### "No pubspec.yaml file found"
- Assurez-vous d'être dans le dossier `mobile-v4`

### "build_runner not found"
- Exécutez d'abord `flutter pub get`

### "Conflicting outputs"
- Utilisez `--delete-conflicting-outputs` pour écraser les anciens fichiers

## Note

Les fichiers générés sont dans `.gitignore` et ne doivent PAS être commités.
