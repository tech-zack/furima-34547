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
- has_many : buys

## items テーブル

| Column             | Type           | Options          |
| ---------------    | -------------  | -----------      |
|   title            |  string        |   NOT NULL       |
| category_id        |  integer       |   NOT NULL       |
|   status_id        |  integer       |   NOT NULL       |
|    user            | references     | foreigen_key:true|
| delivery_fee_id    |  integer       |   NOT NULL       |
| delivery_source_id |  integer       |   NOT NULL       |
| delivery_date_id   |  integer       |   NOT NULL       |
|  product_price     |  integer       |   NOT NULL       |
|  description       |  text          |   NOT NULL       |

### Association

- belongs_to : user
- has_one : buy



## areas テーブル

| Column               | Type        | Options          |
| -----------------    | ----------- | -----------      |
|   municipalities     | string      |   NOT NULL       |
|   address            | string      |   NOT NULL       |
|   building_number    | string      |  
|   order              | references  | foreigen_key:true| 
|   postal_code        | string      |   NOT NULL       |
|  phone_number        | string      |   NOT NULL       |
| delivery_source_id   |  integer    |   NOT NULL       |

### Association

- 
- belongs_to : buy
-

## orders テーブル

| Column               | Type        | option            |
| -----------------    | ----------- | -------------     | 
|   user               | references  |  foreigen key:true| 
|   item               | references  |  foreigen key:true|

### Association

- belongs_to : user
- has_one  : area
- belongs_to : item
