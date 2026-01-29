@echo off
echo ========================================
echo Suppression des fichiers generes du repo
echo ========================================
echo.

echo Suppression des fichiers .freezed.dart...
for /r mobile-v4\lib %%f in (*.freezed.dart) do (
    git rm --cached "%%f" 2>nul
)

echo.
echo Suppression des fichiers .g.dart...
for /r mobile-v4\lib %%f in (*.g.dart) do (
    git rm --cached "%%f" 2>nul
)

echo.
echo Suppression des fichiers .mocks.dart...
for /r mobile-v4\lib %%f in (*.mocks.dart) do (
    git rm --cached "%%f" 2>nul
)

echo.
echo ========================================
echo Termine!
echo ========================================
echo.
echo Prochaines etapes:
echo 1. git add mobile-v4/.gitignore
echo 2. git commit -m "chore: remove generated files from repo"
echo 3. git push origin main
echo.
pause
