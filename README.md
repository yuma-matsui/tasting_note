# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :wines
- has_many :comments
- has_many :likes

## wines テーブル

| Column            | Type       | Options                        |
| ------------------| -----------| -------------------------------|
| name              | string     | null: false                    |
| color_id          | integer    | null: false                    |  
| variety_id        | integer    | null: false                    |
| country_id        | integer    | null: false                    |
| region            | string     |                                |
| vintage           | date       | null: false                    |
| alcohol_volume_id | integer    | null: false                    |
| marriage_food     | string     |                                |
| producer          | string     |                                |
| user              | references | null: false, foreign_key: true |

### Association

- has_one    :look
- has_one    :flavor
- has_one    :taste
- belongs_to :user
- has_many   :comments
- has_many   :likes

## looks テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| color_tone_id | integer    | null: false                    |
| intensity_id  | integer    | null: false                    |
| brightness_id | integer    | null: false                    |
| viscosity_id  | integer    | null: false                    |
| comment       | text       | null: false                    |
| wine          | references | null: false, foreign_key: true |

### Association

- belongs_to :wine

## flavors テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| impression_id    | integer    | null: false                    |
| flavor_volume_id | integer    | null: false                    |
| first_flavor_id  | integer    | null: false                    |
| second_flavor_id | integer    |                                |
| third_flavor_id  | integer    |                                |
| comment          | text       | null: false                    |
| wine             | references | null: false, foreign_key: true |

### Association

- belongs_to :wine

## tastes テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| attack_id        | integer    | null: false                    |
| alcohol_level_id | integer    | null: false                    |
| acidity_level_id | integer    | null: false                    |
| tannic_level_id  | integer    | null: false                    |
| after_flavor_id  | integer    | null: false                    |
| description_id   | integer    | null: false                    |
| comment          | text       | null: false                    |
| wine             | references | null: false, foreign_key: true |

### Association

- belongs_to :wine

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| wine    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :wine

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| wine    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :wine

## articles テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name    | string | null: false |
| content | text   | null: false |

### Association

