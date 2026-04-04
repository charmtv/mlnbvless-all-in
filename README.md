# vless-all-in-one

Linux 服务器一体化代理部署脚本。

它可以帮助你快速部署和管理多种协议，包括 **VLESS**、**VMess**、**Trojan**、**Hysteria2**、**TUIC**、**NaiveProxy**、**Snell**、**SOCKS5** 和 **SS2022**。



## 功能特性

- 一键安装与管理
- 支持多协议共存部署
- 适配 Debian、Ubuntu、CentOS 和 Alpine
- 基于 Xray + Sing-box 双核心架构
- 提供用户管理、路由、订阅与故障排查文档

## 快速安装

```bash
wget -O vless-server.sh https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/vless-server.sh && chmod +x vless-server.sh && ./vless-server.sh
```

或使用仓库中的 `install.sh`（下载同仓库 `main` 分支的 `vless-server.sh` 并执行）：

```bash
curl -fsSL https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/install.sh | bash
```

