# WordPress Development Templates

use [Bedrock](https://roots.io/bedrock/) & docker compose

cf.
- https://qiita.com/ttsuru/items/4d893b30b2be3f0e5e2f
- https://www.tolog.info/wordpress/bedrock-docker/

## Structure

```
/root
  |- /docker
  |    |- /bedrock
  |    |    |- .env.development
  |    |    |- .env.production
  |    |- /db
  |    |- /nginx
  |    |- /php
  |- /src ... WordPress with Bedrock
  |- /theme ... WordPress theme
  |- .env
  |- docker-compose.yml
```

## Development Environment Setup

### :memo: Setup

#### 1. Database, PHP を本番環境にあわせる

Database の種類, バージョン・PHP のバージョンをサイトを公開するサーバーの環境に合わせてください

- Database: `docker-compose.yml`
- PHP: `/docker/php/Dockerfile`

#### 2. 環境変数の設定

```sh
$ cp .env.sample .env
$ cp docker/bedrock/.env.sample docker/bedrock/.env.development
```

### 3. log ファイルの作成

```sh
$ touch docker/php/var/php-error.log
```

### 4. WordPress 環境のインストール

```sh
$ docker compose up -d
$ docker compose exec php composer install
```

## :construction: Dev Server

```sh
$ docker compose up
```

Access: `http://localhost:80`

## :wastebasket: Destroy Development Environment

```sh
$ make destroy
```
