# Implementation Plan

## Investigation findings and decisions

- The homepage is `index.html`. It loops over `site.posts` with `limit: 5`, currently renders `post.excerpt`, and already provides a post link and `Continue reading` link.
- Jekyll is configured in `_config.yml` with `excerpt_separator: <! --more-- >`. Older posts use that separator, while newer posts generally rely on Jekyll's default excerpt behavior. The homepage will continue to use `post.excerpt`, then strip HTML and truncate the result for a compact, text-only summary. This reuses the existing excerpt mechanism and prevents images, headings, code, or videos from appearing in the list.
- The posts do not use one consistent `category` field. A small number define `categories`, many define `tags`, and some define neither. The homepage will display the first explicit category when present, otherwise the first existing tag, and otherwise the literal fallback `未分类`; this avoids inventing categories from titles or editing the entire post archive.
- The current local styling is in `css/main.css`, and the homepage-specific classes are `.gh-feed`, `.gh-post`, `.gh-post-title`, `.gh-post-meta`, `.gh-post-excerpt`, and `.gh-read-more`. The style change will remain within this existing convention, with compact spacing, a category label, wrapping metadata, and mobile-safe text sizing.
- `post.html` renders the full `{{ content }}` for detail pages, so it must not be changed. The detail-page source remains each post's Markdown body under `_posts/`.
- The working tree was clean at the start (`master...origin/master [ahead 1]`) and remained clean after investigation. No commit will be created and no existing user changes will be overwritten.

# Implementation steps

- [ ] 1. Change the homepage Liquid loop in `index.html` to render compact article-list entries rather than article content.
      Keep the existing `site.posts limit: 5` behavior and full archive link. For each post, render the title link, a metadata row containing the date and the category value selected by the explicit-category/first-tag/`未分类` fallback, a text-only truncated `post.excerpt` summary, and a `Continue reading` link. Use `relative_url` for internal post and archive links where appropriate, and do not render `post.content` or alter the detail-page layout.
      Files: `index.html`
      Verify: `bundle exec jekyll build` exits successfully; the generated `_site/index.html` contains five-or-fewer article entries with title, summary, category, and reading links, and does not contain the full body of the representative post `_posts/2026-09-08-球场上的镜像神经元.md`.

- [ ] 2. Add homepage article-list styling in `css/main.css` while preserving the existing simple visual language and detail-page styles.
      Tighten post spacing for scanning, style the category as a readable metadata label without introducing a new visual system, allow metadata to wrap, and add mobile-safe wrapping for long titles and summaries. Keep the existing link colors, typography, content width, and responsive breakpoint; do not change navigation, search, analytics, tag pages, or unrelated presentation styles.
      Files: `css/main.css`
      Verify: `bundle exec jekyll build` exits successfully, and a desktop/mobile review of the generated homepage (using `bundle exec jekyll serve` at the documented local URL when Ruby/Bundler is available) shows no horizontal overflow or clipped article titles, summaries, category labels, or reading links.

- [ ] 3. Validate homepage/detail-page boundaries and repository scope after the template and CSS changes.
      Build the site, inspect the generated homepage and one representative generated post page, and confirm the homepage is summary-only while the post page still contains its complete Markdown-rendered body, including the representative post's headings and images where applicable. Confirm the diff contains only `index.html` and `css/main.css`; do not modify `_config.yml`, `_posts/`, `_layouts/post.html`, analytics, search, or other unrelated features.
      Files: `index.html`, `css/main.css` (verification only; no additional files should be changed)
      Verify: `bundle exec jekyll build` passes; inspect `_site/index.html` and the generated detail page for `_posts/2026-06-27-浙江徒步之五磊山.md`; then run `git status --short` and confirm only the two planned product files are modified and no commit is created.

## Explicit non-goals

- Do not add categories to every post or infer categories from article titles. Use the existing front matter data with the documented fallback.
- Do not add reading-time estimates because no reliable reading-time field or calculation exists in the current site.
- Do not change Google Analytics, `_includes/analytics.html`, the search page, RSS/feed behavior, `all.html`, collection pages, post front matter, or the full-post layout.
- Do not commit or push changes.

## Acceptance criteria

- Each homepage entry shows a linked title, a short excerpt-based summary, a visible category value, and a working reading link.
- The homepage does not render complete post bodies or their article images, code blocks, videos, or later sections.
- A representative detail page still renders the complete post content and existing post navigation.
- The existing five-post homepage limit, archive link, simple typography/colors, and mobile layout remain intact.
- `bundle exec jekyll build` succeeds, and the working tree contains no changes outside the two planned files.

## Environment note

The repository documents `bundle install` followed by `bundle exec jekyll build`/`bundle exec jekyll serve` in `README.md`. During planning, PowerShell could not find `bundle`, so build verification is pending an environment with Ruby/Bundler installed; this is an environment limitation, not a product-code finding.
