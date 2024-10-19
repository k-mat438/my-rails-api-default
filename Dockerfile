FROM ruby:3.2.1-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3
ADD . /myapp