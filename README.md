# my-rails-api-default


rails-apiのテンプレートです。

## 前提

- dockerが必要です。

## setup
1. 基本環境構築
```
docker compose build
```
2. rails アプリケーション作成
```
docker-compose run --no-deps api rails new . --force --database=postgresql --api
```
3. database.yml追加

```
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  host: db
  username: postgres
  password: password
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```

4. db作成
```
docker-compose run api rails db:create
```

5. 起動
```
docker compose up
```

http://localhost:8000

## Gemfile追加

```
gem 'devise'
gem 'devise_token_auth'
gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'faker'

  # Linting and style checking
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
end

```
* Gemインストール
```
docker-compose run --rm api bundle install
```

## rubocop

```
docker compose run --rm web bundle exec rubocop -A
```
