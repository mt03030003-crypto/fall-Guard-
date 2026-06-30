@echo off
echo ================================================
echo Fall Guard API - Push to GitHub
echo ================================================
echo.
echo Repository: https://github.com/mt03030003-crypto/fall-Guard-uploaf
echo.

cd /d "%~dp0"

echo [1/5] Setting remote URL...
git remote set-url origin https://github.com/mt03030003-crypto/fall-Guard-uploaf.git

echo.
echo [2/5] Checking git status...
git status

echo.
echo [3/5] Adding all files...
git add .

echo.
echo [4/5] Committing changes...
git commit -m "Fall Guard API for Railway deployment"

echo.
echo [5/5] Pushing to GitHub...
echo You will be prompted to login with GitHub credentials...
echo.
git push -u origin main

echo.
echo ================================================
echo Done! Now deploy on Railway:
echo 1. Go to https://railway.app
echo 2. New Project → Deploy from GitHub
echo 3. Select: mt03030003-crypto/fall-Guard-uploaf
echo ================================================
pause
