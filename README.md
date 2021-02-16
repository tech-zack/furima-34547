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

| Column               | Type   | Options     |
| ---------------      | ------ | ----------- |
| nickname             | string |  NOT NULL   |
| email                | string |  NOT NULL   |
| encrypted_password   | string |  NOT NULL   |
| first_name(hurigana) | string |  NOT NULL   |
| first_name           | string |  NOT NULL   |
| last_name (hurigana) | string |  NOT NULL   |
| last_name            | string |  NOT NULL   |
| date                 | string |  NOT NULL   |


### Association

- has_many :items
- has_one : areas
- has_one : buys

## items テーブル

| Column             | Type           | Options     |
| ---------------    | -------------  | ----------- |
|   title            |  string        |   NOT NULL  |
| category           |  string        |   NOT NULL  |
|   status           |  string        |   NOT NULL  |
|    user            | references     | 
| delivery_fee_id    |  integer       |   NOT NULL  |
| delivery_source_id |  integer       |   NOT NULL  |
| delivery_date_id   |  integer       |   NOT NULL  |

### Association

- belongs_to : users
- has_one : areas



## areas テーブル

| Column               | Type        | Options     |
| -----------------    | ----------- | ----------- |
|   municipalities     | string      |   NOT NULL  |
|   address            | string      |   NOT NULL  |
|   building_number    | string      |   NOT NULL  |
|   user               | references  |  
|   postal_code        | string      |   NOT NULL  |
|  phone_number        | string      |   NOT NULL  |

### Association

- 
- has_one : buys
-

## buys テーブル

| Column               | Type        | 
| -----------------    | ----------- | 
|   user               | references  |  
|   user_id            |  
|   item_id            | 

### Association

- has_one : users
- has_one : areas
-