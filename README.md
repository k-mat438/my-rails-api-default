# my-rails-api-default


rails-apiのテンプレートです。

## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm api bin/setup
```

## run

```
docker compose up
```

http://localhost:3000

## rubocop

```
docker compose run --rm web bundle exec rubocop -A
```
