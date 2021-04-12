FROM ruby:2.7.2-alpine

ENV APP_PATH /var/pomodoro_up
ENV SCRIPT_PATH /usr/local/bin
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_VERSION 1.17.2
ENV BUNDLE_PATH $GEM_HOME/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

# install dependencies for application
RUN apk -U add --no-cache \
build-base \ 
sqlite-dev \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH 

# navigate to app directory
WORKDIR $APP_PATH
ADD . $APP_PATH/

RUN gem install bundler --version "$BUNDLE_VERSION" && rm -rf $GEM_HOME/cache/*
RUN bundle install
RUN gem install rails
RUN yarn install
RUN rails webpacker:install

# copy entrypoint scripts and grant execution permissions
# TODO move entrypoint files
COPY ./dev-entrypoint.sh $SCRIPT_PATH/dev-entrypoint.sh
COPY ./test-entrypoint.sh $SCRIPT_PATH/test-entrypoint.sh
RUN chmod +x $SCRIPT_PATH/dev-entrypoint.sh && chmod +x $SCRIPT_PATH/test-entrypoint.sh

EXPOSE $RAILS_PORT

ENTRYPOINT [ "bundle", "exec" ]
