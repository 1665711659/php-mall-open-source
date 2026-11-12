# 一键拉取 PHP 商城开源项目源码到 projects/ 目录
# 说明：仅 git clone 上游公开仓库，不修改代码；请遵守各项目 LICENSE。

$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$projectsDir = Join-Path $root 'projects'
New-Item -ItemType Directory -Force -Path $projectsDir | Out-Null

$repos = @(
    @{ name = 'crmeb';            url = 'https://gitee.com/ZhongBangKeJi/CRMEB.git';          desc = 'CRMEB 社区版' },
    @{ name = 'yoshop2.0';        url = 'https://gitee.com/xany/yoshop2.0.git';               desc = '萤火商城 V2.0 服务端' },
    @{ name = 'yoshop2.0-uniapp'; url = 'https://gitee.com/xany/yoshop2.0-uniapp.git';        desc = '萤火商城 V2.0 uniapp' },
    @{ name = 'shopxo';           url = 'https://gitee.com/zongzhige/shopxo.git';             desc = 'ShopXO 服务端' },
    @{ name = 'shopxo-uniapp';    url = 'https://gitee.com/zongzhige/shopxo-uniapp.git';      desc = 'ShopXO uniapp' },
    @{ name = 'likeshop';         url = 'https://gitee.com/likeshop_gitee/likeshop.git';      desc = 'LikeShop 单商户开源版' },
    @{ name = 'sparkshop';        url = 'https://gitee.com/sparkshop/sparkshop.git';          desc = 'SparkShop 星火商城' },
    @{ name = 'a3mall';           url = 'https://gitee.com/xzncit/A3Mall.git';                desc = 'A3Mall' }
)

$ok = 0
$skip = 0
$fail = 0

foreach ($repo in $repos) {
    $target = Join-Path $projectsDir $repo.name
    if (Test-Path $target) {
        Write-Host "[SKIP] $($repo.name) 已存在" -ForegroundColor Yellow
        $skip++
        continue
    }
    Write-Host "[CLONE] $($repo.name) - $($repo.desc)" -ForegroundColor Cyan
    git clone --depth 1 --single-branch $repo.url $target
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[ OK ] $($repo.name)" -ForegroundColor Green
        $ok++
    } else {
        Write-Host "[FAIL] $($repo.name) -> $($repo.url)" -ForegroundColor Red
        $fail++
    }
}

Write-Host ""
Write-Host "完成：成功 $ok，跳过 $skip，失败 $fail"
Write-Host "源码目录：$projectsDir"
Write-Host "提示：微擎没有官方完整开源的商城仓库，未纳入自动下载。"
if ($fail -gt 0) { exit 1 }
