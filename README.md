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
| -------------------- | ------ | -------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| name                 | string | null: false              |
| name_kana            | string | null: false              |

### Association
 
- has_many :introduction 
- has_many :messages
- has_many :likes

## introductions テーブル

| Column         | Type    | Options                      |
| -------------- | ------- | ---------------------------- |
| skill          | string  | null: false                  |
| description    | text    | null: false                  |
| twetter_id     | integer | null: false                  |
| performer_id   | integer | null: false,foreign_key:true |


### Association

- belongs_to :performer
- belongs_to :genre
- has_many :messages
- has_many :likes

## messages テーブル

| Column          | Type    | Options                      |
| ----------------| ------- | ---------------------------- |
| text            | string  | null: false                  |
| performer_id    | integer | null: false,foreign_key:true |
| introduction_id | integer | null: false,foreign_key:true |



### Association

- belongs_to :performer
- belongs_to :introduction

## likes テーブル

| Column          | Type       | Options                      |
| ----------------| -----------| ---------------------------- |
| performer_id    | references | null: false,foreign_key:true |
| introduction_id | references | null: false,foreign_key:true |



### Association

- belongs_to :performer
- belongs_to :introduction

## genres テーブル

| Column          | Type       | Options                      |
| ----------------| -----------| ---------------------------- |
| performer_id    | references | null: false,foreign_key:true |
| introduction_id | references | null: false,foreign_key:true |



### Association

- belongs_to :introduction
- has_many :performers








