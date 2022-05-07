FROM ruby:2.6
WORKDIR /src

# COPY _config.yml /src
COPY Gemfile /src
RUN bundle install

COPY . /src
ENTRYPOINT bundle exec jekyll serve \
  --host 0.0.0.0 --config _config.yml --watch

