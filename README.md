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

若出现**菜单能显示但无法输入数字**（管道方式下 stdin 不是终端），请改用先落盘再执行：`curl -fsSL -o install.sh .../install.sh && bash install.sh`；或使用上面的 `wget` 一行命令。新版 `vless-server.sh` 已尽量从 `/dev/tty` 读取菜单。

### 自动化（推送仓库 / 升级服务器脚本）

- **本机 Windows（多轮重试 `git push`）**：在仓库根目录执行  
  `powershell -ExecutionPolicy Bypass -File .\tools\push-to-github.ps1`  
  可选环境变量：`GIT_PUSH_RETRIES`（默认 8）、`GIT_PUSH_DELAY_SEC`（默认 4）。
- **已在跑的 Linux 服务器**：用 root 执行，从 GitHub `main` 覆盖 `/usr/local/bin/vless-server.sh` 并重建 `ml`：  
  `curl -fsSL https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/tools/upgrade-from-github.sh | bash`

### Cloudflare 自定义域名（install.sh 未与仓库同步时）

若你使用自有域名（例如通过 Cloudflare 反代 `install.sh`），更新仓库后边缘仍可能返回旧内容，可按下面排查：

1. **刷新缓存**：Cloudflare 控制台 → Caching → Purge Cache → **Custom Purge**，填入你的 `https://你的域名/install.sh`（必要时 **Purge Everything**）。
2. **减少误缓存**：Caching → Cache Rules 中，对路径 `/install.sh`（或 `*.sh`）使用 **Bypass cache**，或为该路径设置较短 TTL。
3. **核对源站**：若域名指向 VPS / R2 / Pages，请重新上传或部署与 [仓库 `main` 分支 `install.sh`](https://github.com/charmtv/mlnbvless-all-in/blob/main/install.sh) 一致的文件；若使用 **Workers** 反代 GitHub raw，请确认 `fetch` 的 URL 为 `https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/install.sh`（分支为 `main`），保存并重新部署 Worker。
4. **自检**：`curl -fsSL https://你的域名/install.sh | head` 与 `curl -fsSL https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/install.sh | head` 内容应一致（可用 `curl -v` 查看 `CF-Cache-Status` 判断是否命中旧缓存）。

## 文档入口

- [网站文档](https://docs.vaiox.de/)

## 用于流量统计的自定义 Sing-box 构建

从 **v3.5.3** 开始，**Hysteria2 / TUIC / AnyTLS** 的用户流量统计功能需要启用 `with_v2ray_api` 的自定义 Sing-box 构建。

默认的上游 Sing-box 二进制通常 **不包含** 此能力。

如果你需要使用 Sing-box 的流量同步 / 配额 / 到期等功能，请下载对应 GitHub Release 附件中的自定义 Sing-box，并替换当前的 `/usr/local/bin/sing-box`。

Release 附件中已提供安装说明：

- `README-sing-box-with-v2ray-api.md`

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=charmtv/mlnbvless-all-in&type=Date)](https://www.star-history.com/#charmtv/mlnbvless-all-in&Date)
