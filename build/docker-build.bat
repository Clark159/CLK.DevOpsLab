@echo off
setlocal enabledelayedexpansion

:: ===== variables =====
set enableJFrog=true

:: ===== jfrog =====
if /i "!enableJFrog!"=="true" (
  if not exist "C:\DevOps\JFrog\data" (
    mkdir "C:\DevOps\JFrog\data"
  )
  docker-compose --project-name devops --env-file docker-compose.env up -d --build
  echo.
  echo.
)

:: ===== End =====
if /i "!enableJFrog!"=="true"     echo JFrog:     http://localhost:8081
echo.
echo.
pause