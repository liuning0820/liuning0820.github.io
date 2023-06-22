FROM jekyll/builder:latest
WORKDIR /src
COPY _config.yml /src
COPY Gemfile /src
RUN chmod -R 777 /src/
# RUN bundle install
# COPY . /src
RUN jekyll build
ENTRYPOINT jekyll serve \
  --host 0.0.0.0 --config _config.yml --incremental

