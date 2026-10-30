# Homepage Article List Verification

## Scope

The product-code change is limited to `index.html` and `css/main.css`. The existing task artifacts under `.agents/tasks/` were preserved, and no commit was created.

## Commands run

- `bundle exec jekyll build` — failed before starting because PowerShell could not find `bundle` (`CommandNotFoundException`).
- `Get-Command ruby,bundle,jekyll,docker` — Ruby, Bundler, Jekyll, and Docker are unavailable in this Windows environment.
- `wsl --list --verbose` — no WSL distribution is installed, so it cannot provide the documented Linux fallback.
- `git diff --check` — passed with no whitespace errors.
- PowerShell source-boundary check over `index.html`, `_layouts/post.html`, `_posts/2026-06-27-浙江徒步之五磊山.md`, and `css/main.css` — passed all checks: homepage limit, title link, excerpt summary, category label, reading link, no `post.content`, detail `{{ content }}`, representative Markdown images, and mobile wrapping rules.
- `git status --short; git diff --name-only` — tracked product-code changes remain limited to `index.html` and `css/main.css`; the pre-existing untracked task artifacts were not modified except this required verification record.

## Verified source facts

- The homepage loops over `site.posts limit: 5`.
- Each entry renders a linked title, an excerpt-based summary, a visible category label, and a `Continue reading` link.
- The summary uses `post.excerpt | strip_html | strip_newlines | truncate: 180`, so the homepage list does not render excerpt HTML such as images, headings, videos, or code-block markup.
- The homepage does not reference `post.content`.
- Category selection uses the first explicit `categories` value, then a singular `category` value, then the first existing tag, and finally `未分类`. No post front matter was changed.
- Internal post and archive links use `relative_url`.
- `_layouts/post.html` still renders `{{ content }}`, so detail pages retain the complete Markdown-rendered body and post navigation. The representative detail source still contains Markdown image entries.
- Article metadata uses `flex-wrap`, and titles, summaries, metadata, and reading links use `overflow-wrap: anywhere`. The existing `768px` responsive breakpoint remains in place.
- `_config.yml`, `_layouts/post.html`, `_includes/analytics.html`, search, RSS, and post front matter were not changed.

## Rendered-output limitation

Ruby, Bundler, Jekyll, Docker, and WSL are unavailable. Therefore `bundle install`/`bundle exec jekyll build` could not be completed, no `_site/index.html` or generated representative detail page exists for inspection, and no browser or screenshot check could be performed. The homepage/detail boundary and mobile layout evidence above is source-level only. In a Ruby/Bundler-enabled environment, run `bundle install`, then `bundle exec jekyll build`, inspect `_site/index.html` and the representative post page, and run `bundle exec jekyll serve` at `http://localhost:4000` for desktop and mobile-width checks.
