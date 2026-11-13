# 个人博客审查报告

## 总结

这个站点已经具备个人博客的基本闭环：主页展示最新文章，`all.html` 提供归档，文章页有上下篇导航，站点还提供 RSS、站内搜索、GitHub、Email 和 B 站入口。内容本身是当前最强的资产，尤其是旅行记录、个人思考和工具实践文章，题材清楚，也有持续更新的迹象。

最值得先做的不是重做视觉，而是修正几个会直接影响发现和使用的问题：

1. **先修 SEO 基础元数据和语言声明。** 当前页面的 `<html lang="en">` 与中文主体不符，主页和文章页没有 `description`、canonical 或 Open Graph 元数据。它们修改范围小，却直接影响搜索摘要、分享卡片和无障碍工具对页面语言的判断。
2. **把导航和搜索做成更可靠的移动、键盘可用组件。** 桌面导航项目很多，移动端依赖 JavaScript 展开；`Apps` 使用 `href="#"`，下拉菜单只绑定鼠标悬停，搜索输入缺少可见或关联的 label。手机和键盘用户容易迷路。
3. **保留当前简洁风格，但把首页定位说清楚。** 当前首页标题是 `Work For Free`，正文没有站点简介和 `h1`，访客需要从文章列表推断作者和博客主题。添加一句简介、明确的主标题、文章分类/标签入口和更友好的文章元数据，比全面换主题更划算。
4. **检查 Google Analytics 的检测链路。** 源码和线上主页都包含 `G-RZZFGE3L6V` 的 Google tag，因此“未检测到”不是当前代码中完全缺少标签的证据。仍需在部署后的页面用 Tag Assistant 和 GA4 Realtime 验证请求、数据流 ID、域名和拦截器状态。
5. **把搜索索引和图片作为第二阶段性能工作。** 线上 `search.html` 约 282.8 KB，页面把全部文章内容内嵌到 JavaScript；长文和图片文章会继续扩大索引或页面载荷。文章图片目前主要按 Markdown 原图输出，没有看到尺寸、懒加载或现代格式策略。

以下判断来自线上页面和当前工作区源码。没有启动本地 Jekyll、浏览器自动化、Lighthouse 或 GA 管理后台，因此真实 Core Web Vitals、键盘焦点轨迹、第三方脚本请求和 GA4 收数结果仍需部署环境验证。

## 证据和观察

### 线上页面和内容结构

- 线上主页 [liuning0820.github.io](https://liuning0820.github.io/) 返回 200，主页响应体约 13.4 KB。页面展示 5 篇最新文章，并提供 `Continue reading` 和 `All posts` 入口；这与 `index.html:8-38` 的 `site.posts limit: 5` 和归档链接一致。
- 线上 [All Articles 页面](https://liuning0820.github.io/all.html) 列出大量文章，并继续列出 `_en-us`、`_zh-cn` collection。`all.html:7-30` 的三个列表混用普通 `<ul>`、裸 `<li>` 和 collection，信息完整但层次和语义不统一。
- [AI 图片重命名工具文章](https://liuning0820.github.io/2026/10/03/ai-photo-renamer.html) 内容较完整，包含问题、解决方案、使用步骤、局限和源码入口，是适合搜索和转发的代表性文章。`_posts/2026-01-18-囊肿记.md:1-43` 和 `_posts/2026-06-27-浙江徒步之五磊山.md:1-55` 也显示作者有明确的个人叙事和图片说明习惯。
- 主页线上只检测到 5 个 `h2`，没有 `h1`。`index.html:3-5` 只有 front matter 标题，正文循环从 `h2.gh-post-title` 开始。文章 Markdown 通常自己写 `#` 标题，因此文章页结构与首页不一致。
- 主页的浏览器标题为 `Work For Free`，归档页标题为 `对刘谈心-liuning0820.github.io`，文章页标题是文章标题。这来自 `index.html:1-4`、`all.html:1-4` 和 `_layouts/default.html:11` 的 `<title>{{ page.title }}</title>`。站点名、作者定位和页面标题没有形成一致的标题模板。

### SEO 和内容发现

- `_layouts/default.html:5` 将整个文档声明为 `<html lang="en">`，但线上首页、归档页和文章主体以中文为主。建议至少将默认语言改为中文，并为确实是英文的 collection 页面按页面或 collection 覆盖语言。
- 线上检查结果：主页和代表性文章页没有 `meta name="description"`、`rel="canonical"` 或 `og:*` 元数据。当前 `_layouts/default.html:11-18` 只有 title、字体和 CSS 引用，`_config.yml:7-16` 也没有站点描述字段。搜索引擎可能自行截取正文，社交平台也缺少稳定的分享标题、摘要和图片。
- `jekyll-sitemap` 和 `jekyll-feed` 已在 `_config.yml:30-32` 配置，线上 `/sitemap.xml`、`/feed.xml` 和 `/robots.txt` 均返回 200。这是现有基础设施，不需要另起一套 SEO 系统。
- `search.html:8-22` 将每篇文章的完整 `post.content` 去 HTML 后写入 `window.store`。线上 `search.html` 约 282.8 KB；搜索结果提取页面只显示空的 `ul#search-results`，搜索功能依赖脚本执行。建议后续缩短索引字段、拆分索引或在构建时生成专门的轻量 JSON，并验证中文分词的召回率。
- `_includes/tags.html:4-25` 用 `href="#tag"` 在归档页内定位标签，但标签没有独立页面或可分享 URL。标签名也未经 URL 编码直接成为 id。对少量标签可保留，对长期增长的内容库应改为稳定的分类/标签页。
- 文章中的图片替代文本整体有改善空间。代表性文章 `2026-06-27-浙江徒步之五磊山.md:20-50` 已为每张图写中文 alt 文本，这是可复制的好模式；但仓库还有大量历史图片和文章，建议批量抽查空 alt、文件名式 alt、过长 alt 及重复描述。

### UX/UI 和无障碍

- `_layouts/default.html:24-75` 的导航同时放入 Home、Blogs、FeedReader、Presentations、Channels、Apps、About、RSS 和搜索，信息量偏大。对第一次访问者来说，“Blogs”和首页的关系不够明确，外部实验项目与博客内容没有视觉分组。
- `Apps` 的父链接为 `href="#"`（`_layouts/default.html:37`），它既不像真正页面，也没有按钮语义。桌面下拉在 `css/main.css:400-429` 只通过 `:hover` 打开，键盘 focus 和触摸设备的打开逻辑没有对应实现。
- 移动菜单按钮在 `_layouts/default.html:28` 只有 `aria-label="Menu"`，`aria-expanded` 由点击后脚本才设置，初始状态没有明确值；按钮初始可见内容为空，图标来自 `css/main.css:374-377` 的伪元素。建议使用可见的菜单图标或文字，并在初始 HTML 中设置 `aria-expanded="false"`、`aria-controls` 和唯一菜单 id。
- 搜索表单在 `_layouts/default.html:67-72` 有输入框和按钮，但没有 `<label>`，只有 placeholder。placeholder 不应承担永久 label 的职责。输入框还没有 `autocomplete="off"` 或明确的搜索 landmark；这些不是必须项，但会影响可用性。
- `about.html:11-13` 把 `<h4>` 放在 `<p>` 内，HTML 语义无效；应使用独立的标题和段落。页脚的 “edit this page” 和 “report an issue” 对普通访客较突出，而真正的作者简介较短，信息优先级可以重新安排。
- CSS 已有 `@media (max-width: 768px)`，并对文章标题、元数据使用 `overflow-wrap`（`css/main.css:128-190`、`css/main.css:521-570`），这是移动端防溢出的好处理。仍需用真实手机或浏览器检查导航展开高度、搜索框宽度、长中文标题和代码块是否产生横向滚动。
- 颜色和字号采用 CSS 变量，正文为 18px、行高 1.7（`css/main.css:2-27`），阅读基础不错。焦点样式没有在当前 CSS 中显式定义；应验证浏览器默认 focus 是否在蓝色链接、表单控件和移动菜单上清晰可见。

### Analytics、性能和维护性

- `_includes/analytics.html:1-10` 明确加载 `https://www.googletagmanager.com/gtag/js?id=G-RZZFGE3L6V` 并调用 `gtag('config', 'G-RZZFGE3L6V')`；`_layouts/default.html:9` 在所有默认布局页面的 head 中 include 它。对线上主页的 HTML 检查也找到同一 ID。
- 因此，原始提示“Google tag wasn't detected”更可能来自检测时的缓存/部署延迟、浏览器扩展拦截、检测工具没有执行异步脚本、GA 数据流 ID 或域名配置不匹配，而不是当前工作区缺少 tag。必须在 GA4 管理后台确认该 ID 属于预期 Web data stream，并在 Tag Assistant 和 GA4 Realtime 中看到 page_view；不能只凭源码判断收数正常。
- `_layouts/default.html:12-16` 每页加载 Google Fonts 的 Inter 和 Merriweather，并有两个 preconnect。字体改善阅读观感，但也是第三方请求；应在 Lighthouse 中比较 `font-display`、阻塞时间和实际字体收益，必要时减少字重、使用系统字体或自托管。
- 主页线上约 13.4 KB，代表性文章约 20.8 KB，搜索页约 282.8 KB，feed 约 89.6 KB。这些是当前响应体观察值，不等于压缩后的网络传输量，也不等于浏览器总下载量；仍可作为搜索索引优化的优先级信号。
- `_config.yml:24-27` 排除了 Gemfile 等文件，`Gemfile` 固定 Jekyll 4.3、主题和 `html-proofer`，README 说明可以用 `bundle exec jekyll serve`、Docker 或 compose 构建。仓库当前未发现 `.github/workflows`，也没有 `Gemfile.lock`。这会让 Ruby、插件和主题升级更依赖环境，建议第二阶段补一个可复现的 CI 构建、HTML 检查和链接检查。
- README 的部署说明同时包含 GitHub Pages 和 Netlify（`README.md:31-65`），维护者需要明确哪个是主发布链路。若两个平台都可能发布，tag、缓存、构建失败和 URL 配置应只保留一套权威流程。

## 结论和建议

### 立即可做：低 effort、高收益

| 优先级 | 建议 | 预期收益 | Effort | 需要验证 |
| --- | --- | --- | --- | --- |
| P0 | 在默认布局加入 `lang`、页面 description、canonical、Open Graph 和 Twitter Card；让 title 使用“文章标题 · 对刘谈心”这类统一格式。 | 改善中文识别、搜索摘要、社交分享和重复 URL 处理。 | 小 | 部署后查看首页、文章页源码，并用 Rich Results/社交卡片检查工具复核。 | 
| P0 | 修复 Google tag 验证链路：确认 GA4 数据流 ID 为 `G-RZZFGE3L6V`，在 Tag Assistant 和 Realtime 验证 page_view，再检查自定义域名、缓存和扩展拦截。 | 解决原始告警，并让访问数据可用于内容决策。 | 小，主要是配置验证 | 用无扩展浏览器访问线上页，确认请求发往 Google Analytics 且 Realtime 出现访问。 |
| P0 | 给页面加入唯一、可见的首页 `h1` 和一句中文站点简介；将首页 `Work For Free` 改为能表达作者/博客定位的标题，或保留品牌名但补充副标题。 | 访客和搜索引擎能立即理解站点主题；改善首页语义结构。 | 小 | 用屏幕阅读器或 HTML 检查确认每页标题层级合理。 |
| P1 | 给移动菜单设置初始 `aria-expanded=false`、`aria-controls`，为链接增加清晰 focus 样式；把 `Apps` 改为按钮或真实 landing page，并让下拉支持键盘和触摸。 | 提升手机、键盘和辅助技术用户的导航成功率。 | 小到中 | 用键盘完成打开、进入、关闭菜单；在 320px、768px 宽度检查无溢出。 |
| P1 | 为搜索输入增加 `<label>`，给 RSS 图标补 `aria-label="RSS feed"`，为外部链接和新窗口行为保持清晰文本；修复 `about.html` 中标题嵌套。 | 低成本改善无障碍和语义 HTML。 | 小 | 使用 axe 或 Lighthouse Accessibility，并检查 HTML 验证结果。 |
| P1 | 在主页文章卡片上显示更明确的日期、分类/标签，并将 `Continue reading` 改成包含文章标题的链接文本或补充 `aria-label`。 | 让列表更易扫读，避免多个相同链接在读屏中难以区分。 | 小 | 用键盘和屏幕阅读器检查链接上下文。 |

### 短期改进：中等 effort

| 建议 | 预期收益 | Effort |
| --- | --- | --- |
| 把 `all.html` 改成真正的归档页：使用语义化的 `<section>`、`<h1>`、`<ul>`，按年份分组，统一普通文章与 collection 的展示方式。 | 让 2017 年以来的大量内容更容易浏览，也减少当前裸 `<li>` 和混合标题造成的结构问题。 | 中 |
| 为高价值文章补 front matter 的 `description`、明确 `title`、`tags` 和可选 `image`，并在布局中输出 description 和分享图。优先处理工具实践、旅行攻略和年度 Mindset 文章。 | 提升文章的搜索意图匹配、分享质量和归档稳定性。 | 中，主要是内容整理 |
| 将搜索索引从完整 `post.content` 改为标题、摘要、标签和必要的纯文本字段；若文章量继续增长，再拆成构建时生成的 JSON。 | 降低搜索页首屏体积和 JavaScript 解析成本，同时保留站内搜索。 | 中 |
| 为文章图片提供明确尺寸、`loading="lazy"`、合适的 `width/height`，并将高流量图片转换为 WebP/AVIF；保留原图作为下载时再提供。 | 减少图片传输、布局偏移和移动端耗电。 | 中到大，需处理素材流水线 |
| 在文章页增加阅读时间、目录或“相关文章”，但只在文章有可靠标题层级时启用。 | 长文章更易导航，相关内容的内部链接更强。 | 中 |

### 中长期改进：较大 effort

| 建议 | 预期收益 | Effort |
| --- | --- | --- |
| 建立 GitHub Actions 或等价 CI，执行 `bundle exec jekyll build`、`html-proofer`、Markdown 拼写/格式检查，并固定 Ruby、Bundler 和依赖版本。 | 发布前发现坏链接、Liquid 渲染错误和依赖漂移，降低维护成本。 | 中到大 |
| 明确 GitHub Pages 与 Netlify 的单一主发布链路，并记录域名、构建命令、缓存和回滚方式。 | 避免“本地成功但线上未更新”以及 analytics/URL 配置不一致。 | 中 |
| 为中文和英文 collection 明确语言元数据，必要时加入 `hreflang`，并为文章保留稳定 permalink。 | 改善多语言搜索理解，避免翻译页面互相竞争。 | 中到大 |
| 使用 JSON-LD `Blog`、`BlogPosting`、`Person` 和 `BreadcrumbList`（内容真实且字段完整时）。 | 为搜索引擎提供作者、文章、日期和层级信息。 | 中 |

## 验证边界

- 本次未修改源码、配置、依赖或服务器，也未运行本地 Jekyll、Docker、浏览器自动化或 Lighthouse。
- 线上 `sitemap.xml`、`feed.xml` 和 `robots.txt` 可访问，但没有进一步判断搜索引擎是否已经抓取或收录。
- 线上页面响应大小来自 HTTP 响应观察；未测量 gzip/Brotli 后的传输大小、TTFB、LCP、CLS、INP、缓存命中率或图片实际尺寸。
- Analytics 代码已在线上 HTML 中发现，但无法从公开页面确认 GA4 property 是否收到事件。应把 Tag Assistant 和 GA4 Realtime 作为发布验收条件。
- 计划加入或修改 `description`、OG 图片、结构化数据前，应先确定博客的正式中文名称、作者展示名和分享图；本报告不替用户虚构这些内容。

## 推荐的实施顺序

1. 先验证并修复 GA4 数据流，补默认布局的 `lang`、description、canonical、OG 和统一 title。
2. 加首页 `h1` 与一句定位文案，修复移动菜单、键盘 focus、搜索 label 和 About 页语义。
3. 优化归档与文章元数据，让工具、旅行和年度总结文章具备稳定 description、标签和内部链接。
4. 再处理搜索索引和图片压缩，并用 Lighthouse、axe、真实手机和 GA4 数据验证收益。
5. 最后补 CI 和单一发布链路，降低后续改博客时的回归风险。
