@echo off
setlocal enabledelayedexpansion

:: ===== variables =====
set enableBitbucket=true
set enableBamboo=false
set enableJFrog=true

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
  if not exist "C:\DevOps\JFrog\data" (
    mkdir "C:\DevOps\JFrog\data"
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