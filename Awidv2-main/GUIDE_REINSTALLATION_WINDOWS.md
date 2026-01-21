# Guide de Réinstallation Windows - Configuration Développement

## AVANT LA RÉINSTALLATION

### 1. Copier sur le disque dur externe (D:)
```
D:\backup\
├── projets\           ← Tous tes projets (app livraison, etc.)
├── flutter\           ← Dossier Flutter actuel (optionnel, on peut retélécharger)
└── documents\         ← Documents importants
```

### 2. Noter tes identifiants
- Compte GitHub
- Compte Vercel
- Credentials Supabase (DATABASE_URL, etc.)

---

## APRÈS LA RÉINSTALLATION

### ÉTAPE 1 : Créer la structure sur D:

Ouvrir PowerShell en Admin et exécuter :
```powershell
# Créer les dossiers de développement sur D:
New-Item -ItemType Directory -Path "D:\dev" -Force
New-Item -ItemType Directory -Path "D:\dev\flutter" -Force
New-Item -ItemType Directory -Path "D:\dev\android-sdk" -Force
New-Item -ItemType Directory -Path "D:\dev\.gradle" -Force
New-Item -ItemType Directory -Path "D:\dev\.android" -Force
New-Item -ItemType Directory -Path "D:\dev\.pub-cache" -Force
New-Item -ItemType Directory -Path "D:\Programs" -Force
New-Item -ItemType Directory -Path "D:\projets" -Force
```

---

### ÉTAPE 2 : Configurer les Variables d'Environnement

1. Ouvrir : **Paramètres** → **Système** → **À propos** → **Paramètres avancés du système**
2. Cliquer : **Variables d'environnement**
3. Dans **Variables système**, ajouter :

| Variable | Valeur |
|----------|--------|
| `ANDROID_HOME` | `D:\dev\android-sdk` |
| `ANDROID_SDK_ROOT` | `D:\dev\android-sdk` |
| `FLUTTER_ROOT` | `D:\dev\flutter` |
| `GRADLE_USER_HOME` | `D:\dev\.gradle` |
| `PUB_CACHE` | `D:\dev\.pub-cache` |

4. Modifier la variable **Path** et ajouter :
```
D:\dev\flutter\bin
D:\dev\android-sdk\platform-tools
D:\dev\android-sdk\tools\bin
D:\Programs\nodejs
```

---

### ÉTAPE 3 : Installer les Logiciels sur D:

#### A. Git (sur C: - petit)
- Télécharger : https://git-scm.com/download/win
- Installer sur C: (par défaut) - seulement ~300 MB

#### B. Node.js sur D:
- Télécharger : https://nodejs.org/
- Lors de l'installation, changer le chemin vers : `D:\Programs\nodejs`

#### C. Flutter SDK sur D:
```powershell
# Télécharger Flutter
cd D:\dev
git clone https://github.com/flutter/flutter.git -b stable
```

#### D. Android Studio sur D:
- Télécharger : https://developer.android.com/studio
- Lors de l'installation :
  - Chemin d'installation : `D:\Programs\Android Studio`
  - Android SDK : `D:\dev\android-sdk`

#### E. Configurer Android Studio
1. Ouvrir Android Studio
2. **File** → **Settings** → **Appearance & Behavior** → **System Settings** → **Android SDK**
3. Changer **Android SDK Location** vers : `D:\dev\android-sdk`
4. Installer les composants nécessaires :
   - Android SDK Platform 34
   - Android SDK Build-Tools 34
   - Android SDK Command-line Tools
   - Android Emulator (optionnel)

---

### ÉTAPE 4 : Configurer Gradle sur D:

Créer le fichier `C:\Users\<ton_user>\.gradle\gradle.properties` :
```properties
# Rediriger Gradle vers D:
org.gradle.java.home=D:\\Programs\\Android Studio\\jbr
```

Ou créer un lien symbolique (PowerShell Admin) :
```powershell
# Supprimer le dossier .gradle s'il existe sur C:
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle" -ErrorAction SilentlyContinue

# Créer un lien symbolique vers D:
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gradle" -Target "D:\dev\.gradle"
```

---

### ÉTAPE 5 : Configurer le cache Flutter/Dart sur D:

PowerShell Admin :
```powershell
# Lien symbolique pour .pub-cache
Remove-Item -Recurse -Force "$env:USERPROFILE\.pub-cache" -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.pub-cache" -Target "D:\dev\.pub-cache"

# Lien symbolique pour .android
Remove-Item -Recurse -Force "$env:USERPROFILE\.android" -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.android" -Target "D:\dev\.android"
```

---

### ÉTAPE 6 : Vérifier l'Installation

```powershell
# Vérifier Flutter
flutter doctor -v

# Vérifier Node.js
node --version
npm --version

# Vérifier Git
git --version
```

---

### ÉTAPE 7 : Récupérer tes Projets

```powershell
# Copier tes projets depuis le backup
Copy-Item -Recurse "D:\backup\projets\*" "D:\projets\"
```

---

### ÉTAPE 8 : Configurer Kiro/VS Code

1. Installer Kiro ou VS Code sur C: (petit)
2. Ouvrir le projet depuis D:\projets\app livraison
3. Les dépendances seront téléchargées sur D: automatiquement

---

## RÉSUMÉ DE L'ESPACE DISQUE

### SSD C: (~30-40 GB)
- Windows : ~20 GB
- Git : ~300 MB
- Kiro/VS Code : ~500 MB
- Programmes essentiels : ~10 GB

### HDD D: (~20-30 GB pour le dev)
- Flutter SDK : ~2 GB
- Android SDK : ~10-15 GB
- Gradle cache : ~2-5 GB
- Node.js : ~500 MB
- Projets : Variable
- Pub cache : ~1-2 GB

---

## COMMANDES UTILES APRÈS INSTALLATION

### Accepter les licences Android
```powershell
flutter doctor --android-licenses
```

### Nettoyer les caches (si besoin)
```powershell
flutter clean
flutter pub cache repair
```

### Rebuild un projet Flutter
```powershell
cd D:\projets\app-livraison\mobile
flutter clean
flutter pub get
flutter build apk --release
```

---

## CREDENTIALS À SAUVEGARDER

### Supabase
- DATABASE_URL: postgresql://postgres.mibopjkaifxvirgsbrmt:epau2026epau@aws-1-eu-central-1.pooler.supabase.com:6543/postgres
- JWT_SECRET: mon-secret-jwt-2024
- SUPER_ADMIN_KEY: super-secret-2024

### Vercel
- Projet: app-livraison-one.vercel.app

---

## EN CAS DE PROBLÈME

### Erreur "Flutter SDK not found"
```powershell
# Vérifier la variable d'environnement
echo $env:FLUTTER_ROOT
# Doit afficher : D:\dev\flutter
```

### Erreur "Android SDK not found"
```powershell
# Vérifier la variable d'environnement
echo $env:ANDROID_HOME
# Doit afficher : D:\dev\android-sdk
```

### Erreur Gradle
```powershell
# Vérifier le cache Gradle
echo $env:GRADLE_USER_HOME
# Doit afficher : D:\dev\.gradle
```


---

## DÉPLACER APPDATA VERS D: (TRÈS IMPORTANT)

Les dossiers qui saturent le plus dans AppData :

| Dossier | Taille typique | Contenu |
|---------|----------------|---------|
| `.gradle` | 2-10 GB | Cache Gradle |
| `.android` | 1-5 GB | AVD, cache Android |
| `.pub-cache` | 1-3 GB | Packages Dart/Flutter |
| `npm-cache` | 1-2 GB | Packages Node.js |
| `Android Studio` | 2-5 GB | Cache IDE |

### MÉTHODE 1 : Liens Symboliques (Recommandé)

Exécuter en **PowerShell Administrateur** APRÈS la réinstallation Windows :

```powershell
# === CRÉER LES DOSSIERS SUR D: ===
New-Item -ItemType Directory -Path "D:\AppData\Local" -Force
New-Item -ItemType Directory -Path "D:\AppData\Roaming" -Force

# === GRADLE ===
# Supprimer si existe
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle" -ErrorAction SilentlyContinue
# Créer sur D:
New-Item -ItemType Directory -Path "D:\AppData\.gradle" -Force
# Créer lien symbolique
cmd /c mklink /D "$env:USERPROFILE\.gradle" "D:\AppData\.gradle"

# === ANDROID ===
Remove-Item -Recurse -Force "$env:USERPROFILE\.android" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "D:\AppData\.android" -Force
cmd /c mklink /D "$env:USERPROFILE\.android" "D:\AppData\.android"

# === PUB-CACHE (Flutter/Dart) ===
Remove-Item -Recurse -Force "$env:USERPROFILE\.pub-cache" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "D:\AppData\.pub-cache" -Force
cmd /c mklink /D "$env:USERPROFILE\.pub-cache" "D:\AppData\.pub-cache"

# === NPM CACHE ===
Remove-Item -Recurse -Force "$env:APPDATA\npm-cache" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "D:\AppData\npm-cache" -Force
cmd /c mklink /D "$env:APPDATA\npm-cache" "D:\AppData\npm-cache"

# === NPM GLOBAL ===
Remove-Item -Recurse -Force "$env:APPDATA\npm" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "D:\AppData\npm" -Force
cmd /c mklink /D "$env:APPDATA\npm" "D:\AppData\npm"

# === ANDROID STUDIO CACHE ===
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Google\AndroidStudio*" -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path "D:\AppData\Local\Google" -Force
cmd /c mklink /D "$env:LOCALAPPDATA\Google" "D:\AppData\Local\Google"
```

### MÉTHODE 2 : Variables d'Environnement

Ajouter ces variables d'environnement système :

| Variable | Valeur |
|----------|--------|
| `GRADLE_USER_HOME` | `D:\AppData\.gradle` |
| `ANDROID_USER_HOME` | `D:\AppData\.android` |
| `PUB_CACHE` | `D:\AppData\.pub-cache` |
| `npm_config_cache` | `D:\AppData\npm-cache` |
| `npm_config_prefix` | `D:\AppData\npm` |

### Configurer NPM pour utiliser D:

Après installation de Node.js :
```powershell
npm config set cache "D:\AppData\npm-cache"
npm config set prefix "D:\AppData\npm"
```

### Configurer Gradle pour utiliser D:

Créer le fichier `D:\AppData\.gradle\gradle.properties` :
```properties
org.gradle.jvmargs=-Xmx2048m
```

---

## DÉPLACER LE DOSSIER TEMP VERS D:

Le dossier Temp peut aussi saturer le SSD.

### Via Variables d'Environnement :

1. Créer `D:\Temp`
2. Modifier les variables :
   - `TEMP` → `D:\Temp`
   - `TMP` → `D:\Temp`

### Via PowerShell Admin :
```powershell
# Créer le dossier Temp sur D:
New-Item -ItemType Directory -Path "D:\Temp" -Force

# Définir les variables d'environnement
[Environment]::SetEnvironmentVariable("TEMP", "D:\Temp", "User")
[Environment]::SetEnvironmentVariable("TMP", "D:\Temp", "User")
```

---

## SCRIPT COMPLET À EXÉCUTER APRÈS RÉINSTALLATION

Sauvegarder ce script comme `D:\setup-dev-environment.ps1` :

```powershell
# ============================================
# SCRIPT DE CONFIGURATION ENVIRONNEMENT DEV
# Exécuter en PowerShell Administrateur
# ============================================

Write-Host "=== Configuration de l'environnement de développement ===" -ForegroundColor Green

# Créer la structure sur D:
$folders = @(
    "D:\dev",
    "D:\dev\flutter",
    "D:\dev\android-sdk",
    "D:\Programs",
    "D:\projets",
    "D:\AppData\.gradle",
    "D:\AppData\.android",
    "D:\AppData\.pub-cache",
    "D:\AppData\npm-cache",
    "D:\AppData\npm",
    "D:\AppData\Local\Google",
    "D:\Temp"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
    Write-Host "Créé: $folder" -ForegroundColor Cyan
}

# Créer les liens symboliques
Write-Host "`n=== Création des liens symboliques ===" -ForegroundColor Green

$links = @{
    "$env:USERPROFILE\.gradle" = "D:\AppData\.gradle"
    "$env:USERPROFILE\.android" = "D:\AppData\.android"
    "$env:USERPROFILE\.pub-cache" = "D:\AppData\.pub-cache"
}

foreach ($link in $links.GetEnumerator()) {
    Remove-Item -Recurse -Force $link.Key -ErrorAction SilentlyContinue
    cmd /c mklink /D $link.Key $link.Value
    Write-Host "Lien: $($link.Key) -> $($link.Value)" -ForegroundColor Cyan
}

# Configurer les variables d'environnement
Write-Host "`n=== Configuration des variables d'environnement ===" -ForegroundColor Green

$envVars = @{
    "ANDROID_HOME" = "D:\dev\android-sdk"
    "ANDROID_SDK_ROOT" = "D:\dev\android-sdk"
    "FLUTTER_ROOT" = "D:\dev\flutter"
    "GRADLE_USER_HOME" = "D:\AppData\.gradle"
    "PUB_CACHE" = "D:\AppData\.pub-cache"
    "TEMP" = "D:\Temp"
    "TMP" = "D:\Temp"
}

foreach ($var in $envVars.GetEnumerator()) {
    [Environment]::SetEnvironmentVariable($var.Key, $var.Value, "User")
    Write-Host "Variable: $($var.Key) = $($var.Value)" -ForegroundColor Cyan
}

# Ajouter au PATH
$pathAdditions = @(
    "D:\dev\flutter\bin",
    "D:\dev\android-sdk\platform-tools",
    "D:\Programs\nodejs",
    "D:\AppData\npm"
)

$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
foreach ($addition in $pathAdditions) {
    if ($currentPath -notlike "*$addition*") {
        $currentPath = "$currentPath;$addition"
    }
}
[Environment]::SetEnvironmentVariable("Path", $currentPath, "User")

Write-Host "`n=== Configuration terminée ! ===" -ForegroundColor Green
Write-Host "Redémarrer l'ordinateur pour appliquer les changements." -ForegroundColor Yellow
```

---

## RÉSUMÉ FINAL - ESPACE DISQUE

### Après configuration correcte :

**SSD C: (120 GB) - Utilisation ~25-35 GB :**
- Windows : ~20 GB
- Programmes légers : ~5-10 GB
- Fichiers système : ~5 GB

**HDD D: - Tout le développement :**
- Flutter SDK : ~2 GB
- Android SDK : ~15 GB
- Gradle cache : ~5 GB
- NPM cache : ~2 GB
- Pub cache : ~2 GB
- Projets : Variable
- Temp : Variable

**Économie sur SSD : ~20-30 GB !**
