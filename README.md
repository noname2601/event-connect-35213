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

## performersテーブル

| Column               | Type   | Options                  |
| ---------------------| ------ | -------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| family_name          | string | null: false              |
| first_name           | string | null: false              |
| family_name_kana     | string | null: false              |
| first_name_kana      | string | null: false              |
| birth_day            | date   | null: false              |
| phone_number         | string | null: false              |

### Association
 
- has_many :contracts 
- has_one :introduction

## introductions テーブル

| Column         | Type    | Options                      |
| --------       | ------  | ---------------------------- |
| skill          | string  | null: false                  |
| description    | text    | null: false                  |
| day_price      | integer | null: false                  |
| performer_id   | integer | null: false,foreign_key:true |


### Association

- belongs_to :performer

## requesters テーブル

| Column             | Type   | Options                      |
| --------           | ------ | ---------------------------- |
| company            | string | null: false                  |
| staff              | string | null: false                  |
| email              | string | null: false,unique: true     |
| encrypted_password | string | null: false                  |


### Association

- belongs_to :orders
- has_many :contracts

## orders テーブル

| Column             | Type   | Options                      |
| --------           | ------ | ---------------------------- |
| order_date         | date   | null: false                  |
| event_hall         | string | null: false                  |
| detail             | text   | null: false                  |



### Association

- belongs_to :requester
- has_one :contract

## contractテーブル

| Column               | Type   | Options                       |
| --------             | ------ | ---------------------------   |
| performer_id         | string | null: false,foreign_key:true  |
| requester_id         | string | null: false,foreign_key:true  |


### Association

- belongs_to :performer
- belongs_to :requester
- belongs_to :order