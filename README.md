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

## 订阅兼容性说明

- `/sub/<uuid>/mihomo`：用于 Mihomo、Clash Meta、Clash Verge 等支持新协议的客户端，保留 VLESS / Reality / Hysteria2 / TUIC / AnyTLS 等完整能力。
- `/sub/<uuid>/clash`：用于经典 Clash 兼容客户端，仅输出 VMess / Trojan / Shadowsocks / SOCKS5 等通用协议，避免因不支持新字段导致整份订阅导入失败。
- `/sub/<uuid>/v2ray`：通用 Base64 订阅，适合 v2rayN、v2rayNG、Loon 等以分享链接为主的客户端。

## IP 场景说明

- 未填写域名时，订阅服务默认使用 `HTTP`，避免自签名 `HTTPS` 证书导致客户端拉取订阅失败。
- 如果你坚持在纯 IP 场景下启用 `HTTPS`，部分客户端仍可能因为不信任自签名证书而无法更新订阅。

