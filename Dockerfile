FROM ruby:3.0.2
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    wget \
    curl \
    apt-transport-https \
    vim && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install
RUN rails webpacker:install