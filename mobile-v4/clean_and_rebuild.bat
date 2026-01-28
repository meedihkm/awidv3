@echo off
echo ========================================
echo Nettoyage et Regeneration Freezed
echo ========================================
echo.

echo [1/5] Suppression des fichiers generes...
del /S /Q lib\*.freezed.dart 2>nul
del /S /Q lib\*.g.dart 2>nul
del /S /Q lib\*.mocks.dart 2>nul
echo OK - Fichiers supprimes

echo.
echo [2/5] Nettoyage du cache Flutter...
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" clean
echo OK - Cache nettoye

echo.
echo [3/5] Recuperation des dependances...
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" pub get
echo OK - Dependances recuperees

echo.
echo [4/5] Generation des fichiers Freezed...
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" pub run build_runner build --delete-conflicting-outputs
echo OK - Fichiers generes

echo.
echo [5/5] Verification...
"D:\app sauvegarde\app livraison\flutter_windows_3.38.5-stable\flutter\bin\flutter.bat" analyze
echo OK - Analyse terminee

echo.
echo ========================================
echo Termine!
echo ========================================
pause
