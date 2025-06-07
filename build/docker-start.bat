@echo off
setlocal

:: ===== jfrog =====
if not exist "C:\DevOps\JFrog\data" (
    mkdir "C:\DevOps\JFrog\data"
)

:: ===== bitbucket =====
if not exist "C:\DevOps\Bitbucket\data" (
    mkdir "C:\DevOps\Bitbucket\data"
)

:: ===== bamboo =====
if not exist "C:\DevOps\Bamboo\data" (
    mkdir "C:\DevOps\Bamboo\data"
)

:: ===== build =====
docker-compose --project-name devops up -d --build jfrog bitbucket bamboo
echo Bitbucket started: http://localhost:7990
echo Bamboo started: http://localhost:8085
echo.
echo.

:: ===== End =====
pause
echo.
echo.