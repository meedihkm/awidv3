@echo off
echo ========================================
echo Generation des fichiers Freezed et JSON
echo ========================================
echo.

set FLUTTER_PATH=%~dp0..\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat

echo Etape 1: flutter pub get
"%FLUTTER_PATH%" pub get
if %errorlevel% neq 0 (
    echo ERREUR: flutter pub get a echoue
    pause
    exit /b 1
)

echo.
echo Etape 2: dart run build_runner build
%~dp0..\flutter_windows_3.38.5-stable\flutter\bin\dart.bat run build_runner build --delete-conflicting-outputs
if %errorlevel% neq 0 (
    echo ERREUR: build_runner a echoue
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generation terminee avec succes!
echo ========================================
echo.
echo Les fichiers .freezed.dart et .g.dart ont ete generes.
echo Vous pouvez maintenant builder l'application.
echo.
pause
