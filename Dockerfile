FROM jekyll/jekyll

RUN gem install bundler

WORKDIR /srv/jekyll

COPY Gemfile .

RUN bundle install

EXPOSE 4000

# full path to binaries to avoid wrappers provided by jekyll base container
CMD [ "/usr/gem/bin/bundle", "exec", "/usr/local/bundle/bin/jekyll", "serve", "--port", "4000", "--host", "0.0.0.0" ]

# SIGINT
STOPSIGNAL 2
