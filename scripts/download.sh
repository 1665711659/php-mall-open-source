#!/usr/bin/env bash
# 一键拉取 PHP 商城开源项目源码到 projects/ 目录
# 说明：仅 git clone 上游公开仓库，不修改代码；请遵守各项目 LICENSE。
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECTS_DIR="$ROOT/projects"
mkdir -p "$PROJECTS_DIR"

repos=(
  "crmeb|https://gitee.com/ZhongBangKeJi/CRMEB.git|CRMEB 社区版"
  "yoshop2.0|https://gitee.com/xany/yoshop2.0.git|萤火商城 V2.0 服务端"
  "yoshop2.0-uniapp|https://gitee.com/xany/yoshop2.0-uniapp.git|萤火商城 V2.0 uniapp"
  "shopxo|https://gitee.com/zongzhige/shopxo.git|ShopXO 服务端"
  "shopxo-uniapp|https://gitee.com/zongzhige/shopxo-uniapp.git|ShopXO uniapp"
  "likeshop|https://gitee.com/likeshop_gitee/likeshop.git|LikeShop 单商户开源版"
  "sparkshop|https://gitee.com/sparkshop/sparkshop.git|SparkShop 星火商城"
  "a3mall|https://gitee.com/xzncit/A3Mall.git|A3Mall"
)

ok=0; skip=0; fail=0

for item in "${repos[@]}"; do
  IFS='|' read -r name url desc <<< "$item"
  target="$PROJECTS_DIR/$name"
  if [ -d "$target" ]; then
    echo "[SKIP] $name 已存在"
    skip=$((skip + 1))
    continue
  fi
  echo "[CLONE] $name - $desc"
  if git clone --depth 1 --single-branch "$url" "$target"; then
    echo "[ OK ] $name"
    ok=$((ok + 1))
  else
    echo "[FAIL] $name -> $url"
    fail=$((fail + 1))
  fi
done

echo ""
echo "完成：成功 $ok，跳过 $skip，失败 $fail"
echo "源码目录：$PROJECTS_DIR"
echo "提示：微擎没有官方完整开源的商城仓库，未纳入自动下载。"
[ "$fail" -eq 0 ] || exit 1
