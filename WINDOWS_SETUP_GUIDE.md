# TraeClaw Windows 配置指南

## 快速开始

### 第一步：准备环境

1. 确保安装了 **Node.js 22 或更高版本**
   - 下载地址：https://nodejs.org/
   - 安装后在命令提示符运行 `node -v` 确认版本

2. 确保安装了 **Trae 桌面应用**
   - 下载并安装 Trae
   - 启动 Trae 并登录
   - 打开一个项目

### 第二步：安装依赖

在项目文件夹中打开 PowerShell 或命令提示符，运行：

```powershell
npm install
```

### 第三步：启动 TraeClaw

**方法一（推荐）：双击启动脚本**
- 直接双击 `start-traeapi.cmd` 文件

**方法二：使用 PowerShell**
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-openclaw-integration.ps1
```

### 第四步：验证连接

启动成功后，TraeClaw 会自动：
1. 检测 Trae 安装路径
2. 连接到已打开的 Trae 窗口
3. 启动本地 HTTP 网关
4. 打开聊天页面：http://127.0.0.1:8787/chat

## 手动配置（如果需要）

如果自动检测失败，可以手动编辑 `.env` 文件：

```env
# Trae 可执行文件路径（根据你的实际安装路径修改）
TRAE_BIN=C:\Users\你的用户名\AppData\Local\Programs\Trae\Trae.exe

# 或者其他常见路径：
# TRAE_BIN=C:\Program Files\Trae\Trae.exe
# TRAE_BIN=D:\trae\Trae\Trae.exe

# 项目路径（可选，Trae 会打开这个项目）
TRAE_PROJECT_PATH=C:\path\to\your\project
```

## 故障排除

### 问题：找不到 Trae 可执行文件
- 确认 Trae 已正确安装
- 手动在 `.env` 文件中设置 `TRAE_BIN` 路径

### 问题：无法连接到 Trae 窗口
- 确保 Trae 桌面应用已启动
- 确保 Trae 已登录并打开了项目
- 尝试重启 Trae

### 问题：端口被占用
- 关闭占用 8787 端口的程序
- 或在 `.env` 文件中修改 `PORT` 为其他端口

## 文件说明

- `start-traeapi.cmd` - Windows 一键启动脚本
- `.env` - 环境变量配置文件
- `.env.example` - 配置文件模板
- `scripts/install-openclaw-integration.ps1` - PowerShell 安装脚本

## 验证安装成功

打开浏览器访问：
- 聊天界面：http://127.0.0.1:8787/chat
- 健康检查：http://127.0.0.1:8787/health
- 就绪检查：http://127.0.0.1:8787/ready
