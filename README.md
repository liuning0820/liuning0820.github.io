# Personal Blog Hosted By GitHub Pages

[![Build Status](https://travis-ci.org/liuning0820/liuning0820.github.io.svg?branch=master)](https://travis-ci.org/liuning0820/liuning0820.github.io)

Table Of Context:

- [Run The Site Locally](#run-the-site-locally)
- [Supporting Technology](#supporting-technologies)

## Run The Site Locally

```sh

gem install jekyll bundler
# Run 'bundle install' to install missing gems added in the Gemfile.
bundle install
jekyll -v
# jekyll serve
bundle exec jekyll serve

```

Then browse to [http://localhost:4000](http://localhost:4000)

## Supporting Technologies

- [Jekyll](https://jekyllrb.com/ "Transform your plain text into static websites and blog")
- Jekyll Themes
- [HTML Proofer](https://github.com/gjtorikian/html-proofer) - Validates HTML links, used in the CI/CD pipeline. Installed as a Ruby gem.
- [Markdown Spellcheck](https://www.npmjs.com/package/markdown-spellcheck) - Runs spell check in the CI/CD pipeline. Installed via Node.js npm.
- Github Page
- HTML Presentations - reveal.js

### Jekyll Collection

[Implement Jekyll Collections](https://jekyllrb.com/docs/collections/)

The collection should start with a underscore.

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/liuning0820/liuning0820.github.io/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

#### Jekyll Remote Theme

[A remote Jekyll themes](https://github.com/mmistakes/minimal-mistakes)

### GitHub Page Support

Having trouble with Pages? Check out the [documentation](https://help.github.com/categories/github-pages-basics/) and it will help you sort it out.

### HTML Presentations - reveal.js

## References

- [Travis CI](https://jekyllrb.com/docs/continuous-integration/travis-ci/)
- [Jekyll](https://jekyllrb.com/)

### 同类型博客

- [https://yihui.name](https://github.com/rbind/yihui/)
