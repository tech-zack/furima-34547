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
## users テーブル

| Column               | Type   | Options               |
| ---------------      | ------ | --------------------- |
| nickname             | string |  NOT NULL             |
| email                | string |  NOT NULL unique :true|
| encrypted_password   | string |  NOT NULL             |
| first_name_hurigana  | string |  NOT NULL             |
| first_name           | string |  NOT NULL             |
| last_name _hurigana  | string |  NOT NULL             |
| last_name            | string |  NOT NULL             |
| date                 |  date  |  NOT NULL             |


### Association

- has_many :items
- has_many : buy

## items テーブル

| Column             | Type           | Options     |
| ---------------    | -------------  | ----------- |
|   title            |  string        |   NOT NULL  |
| category_id        |  integer       |   NOT NULL  |
|   status_id        |  integer       |   NOT NULL  |
|    user            | references     | foreigen key|
| delivery_fee_id    |  integer       |   NOT NULL  |
| delivery_source_id |  integer       |   NOT NULL  |
| delivery_date_id   |  integer       |   NOT NULL  |
|  product_price     |  string        |   NOT NULL  |
|  description       |  string        |   NOT NULL  |

### Association

- belongs_to : users
- has_one : buy



## areas テーブル

| Column               | Type        | Options     |
| -----------------    | ----------- | ----------- |
|   municipalities     | string      |   NOT NULL  |
|   address            | string      |   NOT NULL  |
|   building_number    | string      |  
|   user               | references  | foreigen key| 
|   postal_code        | string      |   NOT NULL  |
|  phone_number        | string      |   NOT NULL  |

### Association

- 
- belongs_to : buys
-

## buys テーブル

| Column               | Type        | option       |
| -----------------    | ----------- | -------------|
|   user               | references  |  foreigen key| 
|   item               | references  |  foreigen key|

### Association

- belongs_to : users
- has_one  : areas
- has_one  : items
