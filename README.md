# Tasting Note
![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/c56284ae-9735-4ee8-8f56-21ce9c097ec7)

## URL
* https://tasting-note.com/

## 概要
Tasting NoteはJ.S.Aソムリエ呼称資格認定試験の2次試験である、テイスティング試験対策用のテイスティング記録サービスです。
テイスティングの模擬試験を手軽に行うことができます。

## 特徴
- 登録なしで利用可能
- 片手にワイン、片手にスマホを持って手軽にテイスティングの記録が行える

## サービス利用の流れ

### 登録しないではじめる

1. トップページ下部の「登録しないではじめる」から記録の開始

![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/c463ea66-8cd9-4193-bfe5-228f99c6058c)

2. シート名、テイスティングを行う時間、テイスティングをするワインの色を入力

![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/522402d6-d674-44dd-981e-70bdc2dd3dc0)

3. 外観、香り、味わい、まとめの4つの項目について回答を行う

![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/ae835281-2fde-4d71-bda9-4413b137ad8b)
![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/4250b440-f310-4800-9ebc-488a7049b4b2)
![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/109c79e8-27ac-44b6-909d-1915958a4420)
![image](https://github.com/yuma-matsui/tasting_note/assets/70259961/e2497a42-9595-4dea-81ad-2d4fade4d861)

### 登録をした場合
- テイスティング記録の保存ができます
- 記録したテイスティングに対するワインの登録が行えます

## 開発環境
* Docker 23.0.5
* docker-compose 2.17.3
* Terraform 1.4.6

### API
* ruby 3.1.2
* Rails 7.0.4

### Frontend
* Node.js 18.12.1
* TypeScript 4.9.3
* React 18.2.0

## セットアップ
```shell
$ git clone https://github.com/yuma-matsui/tasting_note.git
$ cd tasting_note
$ git submodule init
$ git submodule update
```

### API
`credentials.yml.enc`のデコードに`master.key`が必要なため`@yuma-matusi`までご連絡ください。

```shell
$ docker-compose run --rm api /bin/sh -c "bin/setup"
```

### Frontend
```shell
$ docker-compose run --rm front /bin/sh -c "npm install"
```

#### 環境変数
`./front/.env`ファイルを作成して下記、環境変数を用意する必要があります。

|  環境変数名  |  説明  |
| ---- | ---- |
|  REACT_APP_API_URL  |  APIへリクエスト送信するためのドメイン  |
|  REACT_APP_FIREBASE_API_KEY  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_PROJECT_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_AUTH_DOMAIN  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_STORAGE_BUCKET  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_MESSAGE_SENDER_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_APP_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_FIREBASE_MEASUREMENT_ID  |  Firebase Authenticationの設定に必要なデータ  |
|  REACT_APP_CF_DOMAIN  | 画像アップロードのリクエスト送信用のドメイン  |
|  REACT_APP_SEND_EMAIL_URL  |  パスワードリセットメールに記載するリンクURL  | 

### Frontend、APIのコンテナ起動
```shell
$ docker-compose up
```

## test・lint

### API

```shell
$ docker-compose run --rm api /bin/sh -c "bundle exec rspec"
$ docker-compose run --rm api /bin/sh -c "bundle exec rubocop"
```

### Frontend

```shell
$ docker-compose run --rm front /bin/sh -c "npm run lint"
$ docker-compose run --rm front /bin/sh -c "npm run test"
```
