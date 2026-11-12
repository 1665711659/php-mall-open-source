# PHP 商城小程序开源项目索引

> 面向接单、二次开发与选型的开源商城源码整理。  
> 本仓库**不直接打包第三方源码**：上游仓库体积大、更新频繁、协议各不相同，直接复制容易过期并带来授权风险。  
> 通过 `scripts/download.ps1` / `scripts/download.sh` 一键拉取到本地 `projects/` 目录（该目录已加入 `.gitignore`）。

## 快速开始

```powershell
# Windows PowerShell
./scripts/download.ps1
```

```bash
# macOS / Linux
bash scripts/download.sh
```

下载完成后目录结构：

```text
projects/
├── crmeb/
├── yoshop2.0/
├── yoshop2.0-uniapp/
├── shopxo/
├── shopxo-uniapp/
├── likeshop/
├── sparkshop/
└── a3mall/
```

> 微擎没有官方完整开源的商城仓库，未列入自动下载；见下文说明。

## 横向对比（Star 数为 2026-11-12 查询，仅供趋势参考）

| 项目 | 技术栈 | 开源协议（以仓库 LICENSE 为准） | 多端能力 | 适合场景 | 仓库 |
| --- | --- | --- | --- | --- | --- |
| CRMEB | ThinkPHP 6 + uni-app + MySQL + Redis | Apache-2.0（社区版；商业版功能另计） | 微信小程序 / H5 / 公众号 / PC / APP | 私域零售、分销、拼团、外包二开 | [ZhongBangKeJi/CRMEB](https://gitee.com/ZhongBangKeJi/CRMEB) |
| 萤火商城 V2.0 | PHP 7.4 + ThinkPHP 6 + uni-app + Ant Design Vue | Apache-2.0 | 微信小程序 / H5 / 公众号 / APP | 轻量自营商城、深度定制、学习 | [xany/yoshop2.0](https://gitee.com/xany/yoshop2.0) |
| ShopXO | ThinkPHP 8 + uni-app | MIT | 微信 / 抖音 / 支付宝 / 百度 / QQ / 快手小程序、H5、APP、PC | 多平台小程序、多门店、进销存 | [zongzhige/shopxo](https://gitee.com/zongzhige/shopxo) |
| LikeShop | ThinkPHP + uni-app | Apache-2.0 | 公众号 / H5 / 微信 / 抖音 / 字节 / 头条小程序、APP | 中小自营商城、知识商品、实物零售 | [likeshop_gitee/likeshop](https://gitee.com/likeshop_gitee/likeshop) |
| SparkShop | PHP 8 + ThinkPHP 8 + uni-app + Element UI | Apache-2.0 | 小程序 / H5 / 公众号 / PC / APP | 同城零售、本地生活、简单多商户 | [sparkshop/sparkshop](https://gitee.com/sparkshop/sparkshop) |
| 微擎 | PHP（非前后端分离） | 商业授权为主，非完整开源 | 公众号 / 小程序插件模块 | 维护老项目，不建议新项目 | [Gitee 组织](https://gitee.com/we7coreteam) / [官网](https://www.w7.cc) |
| A3Mall | ThinkPHP 8 + VUE3 + Element Plus + uni-app | GPL-3.0（可商用，二次分发需遵循 GPL） | 公众号 / H5 / 小程序 / APP / PC / 收银台 | 简单 B2C 商城、老牌 TP 项目二开 | [xzncit/A3Mall](https://gitee.com/xzncit/A3Mall) |

## 项目详解

### 1. CRMEB（接单最多、生态最强，首推）

- **仓库**：<https://gitee.com/ZhongBangKeJi/CRMEB>（Star 约 1.8w）
- **技术栈**：ThinkPHP 6 + uni-app + MySQL + Redis，前后端分离
- **协议**：Apache-2.0（社区版，需保留版权与 NOTICE）；多商户、连锁门店、高级分账等在企业版
- **功能**：商品 SKU、购物车、订单、微信支付、分销、拼团、秒杀、优惠券、会员、DIY 首页装修、小程序直播、积分、抽奖；一套后端支持微信小程序、H5、公众号、PC、APP
- **适合**：私域零售、美妆、生鲜、母婴、分销商城；外包二开最常用
- **优点**：文档、接口文档、视频教程齐全，社区大，踩坑方案多，Gitee 热度高
- **缺点**：多商户、连锁门店、高级分账在商业版；营销功能多，代码体量偏大
- **二开提示**：先跑通 `think` 命令行、队列与定时任务，再改业务；注意版权标识与授权范围

### 2. 萤火商城 V2.0（轻量干净，新手友好）

- **仓库**：
  - 服务端：<https://gitee.com/xany/yoshop2.0>（Star 约 7.5k）
  - uniapp 客户端：<https://gitee.com/xany/yoshop2.0-uniapp>（Star 约 2.9k）
- **技术栈**：PHP 7.4 + ThinkPHP 6 + uni-app + Ant Design Vue 后台
- **协议**：Apache-2.0
- **功能**：基础商城、优惠券、秒杀、会员、订单、退款、模板装修；营销玩法相对克制，代码清爽
- **适合**：简单自营商城、门店零售、水果、服装；想深度改代码、不想被冗余功能拖累
- **优点**：轻量、注释清晰、结构简单，适合学习与二次定制，BUG 相对少
- **缺点**：分销、拼团等营销玩法比 CRMEB 少很多
- **二开提示**：先看 `app/api` 与 `app/store` 的控制器分层，再改前端 `pages` 与 `api` 目录

### 3. ShopXO（ThinkPHP 8，多平台小程序）

- **仓库**：
  - 服务端：<https://gitee.com/zongzhige/shopxo>（Star 约 2.4w）
  - uniapp 客户端：<https://gitee.com/zongzhige/shopxo-uniapp>（Star 约 1.6w）
- **技术栈**：ThinkPHP 8 + uni-app
- **协议**：MIT，免费商用，保留版权声明即可
- **功能**：B2C 单商户、可视化 DIY、多仓库、进销存、多门店；支持微信、抖音、支付宝、百度小程序，可打包 APP
- **适合**：需要多平台小程序、连锁门店、有库存管理需求的项目
- **优点**：TP8 新框架，MIT 协议宽松，插件化
- **缺点**：社区热度比 CRMEB、萤火低，教程偏少
- **二开提示**：插件机制是核心，优先按插件方式扩展，避免直接改核心

### 4. LikeShop

- **仓库**：<https://gitee.com/likeshop_gitee/likeshop>（Star 约 4.5k）
- **技术栈**：ThinkPHP + uni-app
- **协议**：Apache-2.0，开源版免费商用
- **功能**：单商户、基础营销、会员、直播；另有 PHP 多商户商业版
- **适合**：中小型自营商城、知识商品、实物零售
- **优点**：代码规范，更新稳定，官方售后文档完善
- **缺点**：开源版营销玩法有限，高阶功能付费
- **二开提示**：先确认使用的是单商户开源版还是多商户商业版，避免接口与表结构对不上

### 5. SparkShop（星火商城）

- **仓库**：<https://gitee.com/sparkshop/sparkshop>（Star 约 3.2k）
- **技术栈**：PHP 8 + ThinkPHP 8 + MySQL 8 + Element UI + uni-app
- **协议**：Apache-2.0
- **功能**：B2C 商城、页面 DIY、秒杀、优惠券、积分、分销、会员等级；营销功能插件化
- **适合**：本地生活、同城零售、简单多商户入驻
- **优点**：单商户 / 多商户都有，代码简洁，PHP 8 + TP8 技术栈较新
- **缺点**：生态与教程数量不如 CRMEB
- **二开提示**：插件化营销功能适合按需启用，避免一次性全量安装

### 6. 微擎（老项目巨多，不推荐新项目）

- **官网**：<https://www.w7.cc>；**Gitee 组织**：<https://gitee.com/we7coreteam>
- **技术**：PHP（非前后端分离）
- **协议**：商业授权为主，**没有官方完整开源的商城仓库**，因此未纳入自动下载
- **特点**：插件化商城模块，很多老外包单；新项目很少用，架构老旧，不好深度二开
- **适合**：维护老系统，不适合新开发
- **二开提示**：接手老项目先梳理模块授权、微擎版本与 PHP 版本，再动代码

### 7. A3Mall（老牌）

- **仓库**：<https://gitee.com/xzncit/A3Mall>（Star 约 0.7k）
- **技术栈**：ThinkPHP 8 + VUE3 + Element Plus + uni-app
- **协议**：GPL-3.0（可商用；二次分发需遵循 GPL 开源义务）
- **功能**：B2C 基础商城、公众号 / H5 / 小程序 / APP / PC / 收银台，前后端源码 100% 开源
- **适合**：简单商城、老牌 TP 项目二开
- **优点**：技术栈较新，代码结构清晰，免费商用
- **缺点**：社区活跃度与教程数量一般
- **二开提示**：适合作为中小型自营商城的起点，复杂营销需自行扩展

## 选型建议

| 需求 | 推荐 |
| --- | --- |
| 接单、分销、拼团、私域营销，需要大量现成教程 | **CRMEB** |
| 代码干净、轻量、自己深度定制、简单自营商城 | **萤火商城 V2.0** |
| 想用 TP8、MIT 协议，同时做抖音 + 微信多平台小程序 | **ShopXO** |
| 中小自营、知识商品、需要 Apache-2.0 宽松协议 | **LikeShop** |
| 同城 / 本地生活、简单多商户 | **SparkShop** |
| 维护老微擎项目 | **微擎**（不建议新项目） |
| 老牌 TP 商城、预算有限 | **A3Mall** |

## 二开通用检查清单

1. **环境**：PHP 版本与框架匹配（TP6 多为 PHP 7.4，TP8 需 PHP 8.0+），安装 MySQL 8、Redis、Composer。
2. **伪静态**：Nginx 需配置 ThinkPHP 的 `try_files` 规则，否则后台与 API 路由 404。
3. **队列与定时任务**：商城普遍依赖队列处理订单超时、消息通知；上线前配置 supervisor 与 crontab。
4. **微信配置**：小程序 AppID/Secret、支付证书、回调域名必须与后台配置一致。
5. **uni-app 编译**：确认 HBuilderX 版本与 `manifest.json` 中的 AppID，避免打包后接口域名白名单不生效。
6. **授权与版权**：二次开发前阅读各仓库 LICENSE，保留版权声明；Apache-2.0 需保留 NOTICE，GPL-3.0 二次分发有开源义务；商业版功能不要从盗版渠道获取。
7. **安全**：上线前修改默认后台路径与管理员密码，关闭调试模式，限制 `storage` / `runtime` 目录访问。

## 协议与免责声明

- 本仓库仅做项目索引与选型整理，**不包含第三方源码**，也不对第三方项目的功能、安全性、授权合规性作担保。
- 各项目的协议、功能与商业版边界请以官方仓库与官网为准；Star 数会随时间变化。
- 下载脚本仅执行 `git clone`，不会修改上游代码；请遵守对应项目的 LICENSE 与商业授权条款。
