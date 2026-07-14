@echo off
chcp 65001 > nul
title Better - Invex ^| Subir cambios

echo.
echo ============================================================
echo             BETTER - INVEX ^| SUBIR CAMBIOS
echo ============================================================
echo.

where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git no esta instalado o no esta agregado al PATH.
    pause
    exit /b 1
)

cd /d "%~dp0"
if not exist ".git" (
    echo ERROR: Ejecuta primero 1_CREAR_REPO_Y_SUBIR.bat
    pause
    exit /b 1
)

set /p MENSAJE=Describe brevemente el cambio: 
if "%MENSAJE%"=="" set MENSAJE=Actualizacion Better - Invex

git add .
git diff --cached --quiet
if not errorlevel 1 (
    echo No hay cambios nuevos para subir.
    pause
    exit /b 0
)

git commit -m "%MENSAJE%"
git push

if errorlevel 1 (
    echo ERROR: No se pudieron subir los cambios.
    pause
    exit /b 1
)

echo.
echo LISTO: Los cambios ya se enviaron a GitHub.
echo.
pause
