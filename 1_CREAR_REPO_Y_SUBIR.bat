@echo off
chcp 65001 > nul
title Better - Invex ^| Crear repositorio

echo.
echo ============================================================
echo        BETTER - INVEX ^| CREAR REPOSITORIO Y SUBIR
echo ============================================================
echo.
echo 1. Crea en GitHub un repositorio vacio llamado Better-Invex.
echo 2. Copia su enlace HTTPS.
echo.
set /p REPO_URL=Pega aqui el enlace HTTPS del repositorio: 

if "%REPO_URL%"=="" (
    echo ERROR: No escribiste la direccion del repositorio.
    pause
    exit /b 1
)

where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git no esta instalado o no esta agregado al PATH.
    pause
    exit /b 1
)

cd /d "%~dp0"
if not exist ".git" git init

git add .
git commit -m "Primera version de Better - Invex"
git branch -M main
git remote remove origin >nul 2>&1
git remote add origin "%REPO_URL%"
git push -u origin main

if errorlevel 1 (
    echo.
    echo ERROR: No se pudo completar el proceso. Revisa el mensaje anterior.
    pause
    exit /b 1
)

echo.
echo LISTO: El proyecto ya fue enviado a GitHub.
echo Activa Pages en Settings ^> Pages ^> main ^> root.
echo.
pause
