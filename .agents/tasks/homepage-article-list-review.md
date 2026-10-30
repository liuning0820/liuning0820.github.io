# Homepage article-list review

审查范围包括批准任务、实现计划、实现者验证记录、当前未提交 diff，以及首页、详情页、代表性文章、配置和相关 CSS。审查没有修改生产代码，也没有运行完整构建或测试套件。

从源代码看，`index.html:10-38` 保留了 `site.posts limit: 5` 和归档入口。每个条目在 `index.html:13` 输出标题链接，在 `index.html:17-25` 按显式 `categories`、单数 `category`、首个 `tag`、`未分类` 的顺序选择分类，在 `index.html:30-31` 输出经过 `strip_html`、`strip_newlines` 和 `truncate: 180` 的摘要及阅读链接。循环没有引用 `post.content`，因此实现路径不会把完整文章正文、图片、代码或视频放进首页。这个分类方案使用现有 front matter 数据，没有根据标题臆测或修改文章。

详情页没有被改动。`_layouts/post.html:5-15` 仍然渲染 `{{ content }}` 和前后文章导航；代表文章 `_posts/2026-06-27-浙江徒步之五磊山.md:15-48` 仍保留 Markdown 图片。`css/main.css:166-220` 为列表收紧间距、允许元数据换行并为标题、摘要、元数据和阅读链接设置断行；`css/main.css:479-557` 保留既有 `768px` 断点并缩小移动端标题和元数据。当前 diff 的产品代码仅为 `index.html` 和 `css/main.css`，验证记录称 `git diff --check` 已通过；Google Analytics、搜索页、配置、文章 front matter 和详情布局均未修改。

仍有一个必须解决的验证阻塞。实现计划的验收要求构建成功，并检查生成的首页、代表性详情页和移动端布局。验证记录 `homepage-article-list-verification.md:9-12,31` 明确说明 Bundler、Ruby、Jekyll 和 Docker 均不可用，因此 `bundle exec jekyll build` 没有执行，没有生成 `_site` HTML，也没有进行浏览器或截图检查。静态源代码检查不能证明 Liquid 实际编译成功、生成首页确实只包含五条以内的摘要、详情页实际保留完整正文，或移动端渲染没有溢出。这会阻止本次审查批准。

修正方式：在具备 Ruby/Bundler 的环境中按记录运行 `bundle install` 和 `bundle exec jekyll build`，检查生成的 `_site/index.html` 与代表性详情页，确认首页没有代表文章的完整正文并确认详情页包含正文和图片；再在桌面和移动宽度打开生成站点或运行 `bundle exec jekyll serve`，记录标题、摘要、分类、阅读链接没有裁切或水平溢出。补齐这些证据后再复审。当前门控结论为 `CHANGES_REQUESTED`，唯一 finding 是上述缺失的必需验证，不是对已确认源代码行为的可选清理建议。
