# Personal Blog

## Run The Site Locally

```sh
# Run gem install a b to install gem package 'a' and 'b'.
gem install jekyll bundler
# Run 'bundle install' to install missing gems added in the Gemfile.
bundle install
jekyll -v
# jekyll serve
bundle exec jekyll serve

```

Then browse to [http://localhost:4000](http://localhost:4000)

### Run the site with docker

Refer <https://medium.com/windmill-engineering/how-i-built-a-simple-static-jekyll-site-without-installing-ruby-a-rant-b7e87fb123d0>

```sh

docker build -t my-jekyll-env -f Dockerfile .
docker run --name my-jekyll-env --mount type=bind,source=$(pwd),target=/src -p 4000:4000 -it my-jekyll-env


```

### Run the site with docker compose

```sh

docker compose build
docker compose up

navigate to 127.0.0.1:4000


```

## Hosted By GitHub Pages

Hosted at [https://liuning0820.github.io/](https://liuning0820.github.io/)

## Hosted by Netlify

Netlify is a cloud computing company that offers hosting and serverless backend services for static websites. It features continuous deployment from Git across a global application delivery network, serverless form handling, support for AWS Lambda functions, and full integration with Let's Encrypt.

The site dashboard can be accessed [Site Dashboard](https://app.netlify.com/sites/liuning0820/overview)

Deployed at [https://liuning0820.netlify.com/](https://liuning0820.netlify.com/)

### Netlify Deploy Error Troubleshooting

#### requires rubygems version >= 3.3.22

3:44:21 PM: ffi-1.17.0-x86_64-linux-musl requires rubygems version >= 3.3.22, which is
3:44:21 PM: incompatible with the current version, 3.0.8
3:44:21 PM: Error during gem install
3:44:21 PM: Failing build: Failed to install dependencies

- Solution

Set a RUBY_VERSION environment variable. <https://docs.netlify.com/configure-builds/manage-dependencies/#ruby>

RUBY_VERSION 3.1.1

## Supporting Technologies

- [Jekyll](https://jekyllrb.com/ "Transform your plain text into static websites and blog")
- Jekyll Themes
- [HTML Proofer](https://github.com/gjtorikian/html-proofer) - Validates HTML links, used in the CI/CD pipeline. Installed as a Ruby gem.
- [HTML Proofer Usage](https://simpleit.rocks/web/html/how-to-check-local-websites-for-broken-links/)
- [Markdown Spellcheck](https://www.npmjs.com/package/markdown-spellcheck) - Runs spell check in the CI/CD pipeline. Installed via Node.js npm.
- Github Page
- HTML Presentations - reveal.js
- Search Feature - lunr.js

### Jekyll Collection

[Implement Jekyll Collections](https://jekyllrb.com/docs/collections/)

The collection should start with a underscore.

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/liuning0820/liuning0820.github.io/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### jekyll-sitemap

silently generate a sitemap.xml for your jekyll site.

https://liuning0820.github.io/sitemap.xml

### GitHub Page Support

Having trouble with Pages? Check out the [documentation](https://help.github.com/categories/github-pages-basics/) and it will help you sort it out.

### HTML Presentations - reveal.js

#### PDF Export

ex. http://localhost:4000/ex_presentations/2021-05_a_clean_dev_env/?print-pdf#/
ex. https://liuning0820.github.io/ex_presentations/2021-05_a_clean_dev_env/?print-pdf#/

## SEO

### Sitemaps

The Sitemaps protocol allows a webmaster to inform search engines about URLs on a website that are available for crawling. [refer](#jekyll-sitemap)



### robots.txt

robots.txt可以告诉搜索引擎您网站的哪些页面可以被抓取，哪些页面不可以被抓取。 

```robots.txt

User-agent: *
Disallow: /
```

### Google Analytics 数据增长

统计你的网站的访问量等相关数据。

[Google Analytics](https://analytics.google.com/analytics/web/)

### Bing 网站管理员

https://www.bing.com/webmaster/home/dashboard

## References

- [Travis CI](https://jekyllrb.com/docs/continuous-integration/travis-ci/)
- [Jekyll](https://jekyllrb.com/)
- [Hugo-gitlab-page](https://tkainrad.dev/posts/using-hugo-gitlab-pages-and-cloudflare-to-create-and-run-this-website/)

### 同类型博客

- [https://yihui.name](https://github.com/rbind/yihui/)
- [home-assistant](https://github.com/home-assistant/home-assistant.io)
