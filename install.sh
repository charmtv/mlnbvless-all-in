#!/usr/bin/env bash
# 一键下载并执行主脚本（与仓库 main 分支 vless-server.sh 一致）
# 用法: curl -fsSL https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/install.sh | bash
set -euo pipefail
readonly RAW_BASE="https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main"
curl -fsSL -o vless-server.sh "${RAW_BASE}/vless-server.sh"
chmod +x vless-server.sh
exec ./vless-server.sh "$@"
