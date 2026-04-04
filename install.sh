#!/usr/bin/env bash
# 一键下载并执行主脚本（与仓库 main 分支 vless-server.sh 一致）
# 用法: curl -fsSL https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main/install.sh | bash
set -euo pipefail
readonly RAW_BASE="https://raw.githubusercontent.com/charmtv/mlnbvless-all-in/main"
curl -fsSL -o vless-server.sh "${RAW_BASE}/vless-server.sh"
chmod +x vless-server.sh
# curl … | bash 时当前 shell 的 stdin 是管道，直接 exec 子脚本会继承管道，菜单 read 立刻 EOF。
# 显式把主脚本的 stdin 接到终端，子菜单/选项才能正常输入。
if [[ -r /dev/tty ]]; then
  exec ./vless-server.sh "$@" </dev/tty
else
  exec ./vless-server.sh "$@"
fi
