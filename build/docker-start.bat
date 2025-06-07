@echo off
setlocal

:: ===== Bamboo =====
if not exist "C:\Bamboo\data" (
    mkdir "C:\Bamboo\data"
)
docker-compose --project-name devops up -d --build
echo Bamboo started: http://localhost:8085
echo.
echo.

:: ===== End =====
pause
echo.
echo.