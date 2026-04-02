@echo off
setlocal EnableDelayedExpansion

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 检查 Node.js 是否安装
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo 错误: 未找到 Node.js。请先安装 Node.js 22 或更高版本。
  echo 下载地址: https://nodejs.org/en/download/
  pause
  exit /b 1
)

REM 检查 Node.js 版本
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
REM 提取版本号数字部分
for /f "tokens=2 delims=v" %%i in ("%NODE_VERSION%") do set NODE_VERSION_NUM=%%i
REM 检查主版本号是否 >= 22
for /f "tokens=1 delims=." %%i in ("%NODE_VERSION_NUM%") do set NODE_MAJOR_VERSION=%%i
if %NODE_MAJOR_VERSION% lss 22 (
  echo 错误: Node.js 版本过低。需要 Node.js 22 或更高版本，当前版本: %NODE_VERSION%
  echo 下载地址: https://nodejs.org/en/download/
  pause
  exit /b 1
)

echo 正在启动 TraeClaw...
echo Node.js 版本: %NODE_VERSION%
echo 工作目录: %CD%
echo.

REM 启动 quickstart 脚本
node scripts\quickstart.js
if errorlevel 1 (
  echo.
  echo 错误: TraeClaw 启动失败。
  echo 请检查以下事项:
  echo 1. Trae 应用是否已安装
  echo 2. Trae 应用是否能正常启动并登录
  echo 3. 网络连接是否正常
  echo 4. 端口 8787 是否被占用
  pause
  exit /b %errorlevel%
)

echo.
echo TraeClaw 启动成功！
echo 访问地址: http://127.0.0.1:8787/chat
echo API 地址: http://127.0.0.1:8787
echo.
echo 按任意键退出...
pause >nul

