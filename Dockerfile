FROM ruby:3.1.2


RUN apt-get update && apt-get install -y build-essential apt-utils libpq-dev imagemagick libmagickwand-dev cron --no-install-recommends && \
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh &&\
    apt-get install -y nodejs --no-install-recommends &&\
    npm i -g yarn && mkdir app && rm -rf nodesource_setup.sh && gem install foreman

WORKDIR /app
RUN gem install bundler:2.3.21 && bundle config build.nokogiri --use-system-libraries && bundle config force_ruby_platform false
# Install JS dependencies before copying app code to use layer caching.
# Note: In JS heavy apps consider an approach similar to bundler.
COPY package.json yarn.lock ./
RUN yarn install

COPY Gemfile* .ruby-version ./
RUN bundle install

COPY . .
# Un comment this if you want a production build
# ARG SECRET_KEY_BASE

# RUN RAILS_ENV=production SECRET_KEY_BASE=${SECRET_KEY_BASE} bin/rake assets:precompile

CMD [ "rails", "server", "-b", "0.0.0.0" ]
