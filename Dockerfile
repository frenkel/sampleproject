FROM ruby:2.7

# diffutils is a dependency of the diffy gem
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

RUN adduser deploy

WORKDIR /app

COPY Gemfile* ./
RUN mkdir -p vendor
RUN gem install bundler -v '2.3.7'
RUN bundle install --deployment --without test development
COPY . .

RUN mkdir -p tmp/pids
RUN chown -R deploy tmp log

USER deploy
ENV RAILS_LOG_TO_STDOUT 1

EXPOSE 3000
CMD bundle exec unicorn -c config/unicorn.rb -E deployment
