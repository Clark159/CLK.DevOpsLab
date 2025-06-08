@echo off
setlocal enabledelayedexpansion

:: ===== variables =====
set enablePostgreSQL=true
set enableBitbucket=false
set enableBamboo=false
set enableJFrog=true

:: ===== postgresql =====
if /i "!enablePostgreSQL!"=="true" (
  if not exist "C:\DevOps\PostgreSQL\data" (
    mkdir "C:\DevOps\PostgreSQL\data"
  )
  docker-compose --project-name devops up -d --build postgresql
  echo.
  echo.
)

:: ===== bitbucket =====
if /i "!enableBitbucket!"=="true" (
  if not exist "C:\DevOps\Bitbucket\data" (
    mkdir "C:\DevOps\Bitbucket\data"
  )
  docker-compose --project-name devops up -d --build bitbucket
  echo.
  echo.
)

:: ===== bamboo =====
if /i "!enableBamboo!"=="true" (
  if not exist "C:\DevOps\Bamboo\data" (
    mkdir "C:\DevOps\Bamboo\data"
  )
  docker-compose --project-name devops up -d --build bamboo
  echo.
  echo.
)

:: ===== jfrog =====
if /i "!enableJFrog!"=="true" (
  if not exist "C:\DevOps\JFrog\data\etc\security" (
    mkdir "C:\DevOps\JFrog\data\etc\security"
  )
  if not exist "C:\DevOps\JFrog\data\etc\security\master.key" (
    powershell -Command "$hex = '0123456789ABCDEF'; $key = -join (1..32 | ForEach-Object { $hex[(Get-Random -Maximum 16)] }); Set-Content -Path 'C:\DevOps\JFrog\data\etc\security\master.key' -Value $key -NoNewline"
  )
  if not exist "C:\DevOps\JFrog\data\etc\security\join.key" (
    powershell -Command "$key = [guid]::NewGuid().ToString(); Set-Content -Path 'C:\DevOps\JFrog\data\etc\security\join.key' -Value $key -NoNewline"
  )
  docker-compose --project-name devops up -d --build jfrog
  echo.
  echo.
)

:: ===== End =====
if /i "!enableBitbucket!"=="true" echo Bitbucket: http://localhost:7990
if /i "!enableBamboo!"=="true"    echo Bamboo:    http://localhost:8085
if /i "!enableJFrog!"=="true"     echo JFrog:     http://localhost:8081
echo.
echo.
pause