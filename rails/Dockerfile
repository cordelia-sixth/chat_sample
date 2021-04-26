FROM ruby:2.7.1-alpine3.11

ENV BUNDLER_VERSION=2.1.4

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN apk update && \
    apk add --no-cache \
    shared-mime-info \
    yarn \
    nodejs \
    linux-headers \
    libxml2-dev \
    curl-dev \
    make \
    gcc \
    libc-dev \
    g++ \
    mariadb-dev \
    tzdata && \
    gem install bundler && \
    bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]