@echo off
setlocal

:: ===== bitbucket =====
if not exist "C:\DevOps\Bitbucket\data" (
    mkdir "C:\DevOps\Bitbucket\data"
)
docker-compose --project-name devops up -d --build bitbucket

:: ===== bamboo =====
if not exist "C:\DevOps\Bamboo\data" (
    mkdir "C:\DevOps\Bamboo\data"
)
docker-compose --project-name devops up -d --build bamboo

:: ===== jfrog =====
if not exist "C:\DevOps\JFrog\data" (
    mkdir "C:\DevOps\JFrog\data"
)
docker-compose --project-name devops up -d --build jfrog

:: ===== End =====
echo Bitbucket started: http://localhost:7990
echo Bamboo started: http://localhost:8085
echo JFrog started: http://localhost:8081
pause
echo.
echo.