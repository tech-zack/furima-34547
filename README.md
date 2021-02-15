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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string |  NOT NULL   |
| password | string |  NOT NULL   |
| nickname | string |  NOT NULL   |
| birthday | string |  NOT NULL   |
|  name    | string |  NOT NULL   |


### Association

- has_many :prototypes
- has_many :comments

## furimas テーブル

| Column     | Type           | Options     |
| ---------- | -------------  | ----------- |
|   title    | string         |   NOT NULL  |
| catch_copy | text           |   NOT NULL  |
|   concept  | text           |   NOT NULL  |
|   image    | ActiveStorage  |
|    user    | references     | 

### Association

- belongs_to : users
- has_many   : comments


## comments テーブル

| Column     | Type        | Options     |
| ---------- | ----------- | ----------- |
|   text     | text        |   NOT NULL  |
|   user     | references  |  
|   prototype| references  |   

### Association

- belongs_to :users
- belongs_to :prototypes


