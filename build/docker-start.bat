@echo off
setlocal


:: ===== bitbucket =====
if not exist "C:\DevOps\Bitbucket\data" (
    mkdir "C:\DevOps\Bitbucket\data"
)

:: ===== build =====
docker-compose --project-name devops up -d --build
echo Bitbucket started: http://localhost:8085
echo.
echo.

:: ===== End =====
pause
echo.
echo.