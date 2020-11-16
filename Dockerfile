FROM ruby:2.6
RUN gem install jekyll bundler
WORKDIR /src

COPY _config.yml /src
COPY Gemfile /src

RUN bundler install

ENTRYPOINT bundle exec jekyll serve \
  --host 0.0.0.0 --config _config.yml --watch

