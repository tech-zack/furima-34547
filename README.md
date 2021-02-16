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

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string |  NOT NULL   |
| e-mail     | string |  NOT NULL   |
| password   | string |  NOT NULL   |
| first_name | string |  NOT NULL   |
| last_name  | string |  NOT NULL   |
| birthday   | string |  NOT NULL   |


### Association

- has_many :items
- has_one : areas
- has_one : buys

## items テーブル

| Column          | Type           | Options     |
| --------------- | -------------  | ----------- |
|   title         |  string        |   NOT NULL  |
| category        |  string        |   NOT NULL  |
|   status        |  string        |   NOT NULL  |
|   image         | ActiveStorage  |
|    user         | references     | 
| delivery_fee    |  string        |   NOT NULL  |
| delivery_source |  string        |   NOT NULL  |
| delivery_date   |  string        |   NOT NULL  |

### Association

- belongs_to : users
- has_one : areas



## areas テーブル

| Column               | Type        | Options     |
| -----------------    | ----------- | ----------- |
|   shipping_adress    | string      |   NOT NULL  |
|   user               | references  |  
|   postal_code        | string      |   NOT NULL  |
|  phone_number        | string      |   NOT NULL  |

### Association

- has_one : areas
- has_one : buys
- has_one : users

## buys テーブル

| Column               | Type        | 
| -----------------    | ----------- | 
|   user               | references  |  


