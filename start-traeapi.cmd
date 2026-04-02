@echo off
setlocal EnableDelayedExpansion

REM Change to script directory
cd /d "%~dp0"

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo ERROR: Node.js not found. Please install Node.js 22 or higher.
  echo Download: https://nodejs.org/en/download/
  pause
  exit /b 1
)

REM Check Node.js version
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
REM Extract version number
for /f "tokens=2 delims=v" %%i in ("%NODE_VERSION%") do set NODE_VERSION_NUM=%%i
REM Check major version >= 22
for /f "tokens=1 delims=." %%i in ("%NODE_VERSION_NUM%") do set NODE_MAJOR_VERSION=%%i
if %NODE_MAJOR_VERSION% lss 22 (
  echo ERROR: Node.js version too old. Need Node.js 22 or higher, current: %NODE_VERSION%
  echo Download: https://nodejs.org/en/download/
  pause
  exit /b 1
)

echo Starting TraeClaw...
echo Node.js version: %NODE_VERSION%
echo Working directory: %CD%
echo.

REM Start quickstart script
node scripts\quickstart.js
if errorlevel 1 (
  echo.
  echo ERROR: TraeClaw failed to start.
  echo Please check:
  echo 1. Trae app is installed
  echo 2. Trae app can start and login normally
  echo 3. Network connection is normal
  echo 4. Port 8787 is not in use
  pause
  exit /b %errorlevel%
)

echo.
echo TraeClaw started successfully!
echo Chat URL: http://127.0.0.1:8787/chat
echo API URL: http://127.0.0.1:8787
echo.
echo Press any key to exit...
pause >nul
