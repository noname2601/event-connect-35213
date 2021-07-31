# README

## アプリケーション名
「EVENT-CONNECT」


## アプリケーションの概要
パフォーマンスを仕事とする演者の方を支援・紹介するマッチング・サービスです。

## URL
https://event-connect-35213.herokuapp.com/

## Basic認証
ユーザー名 : admin  
パスワード : 2222  

## テスト用アカウント
メールアドレス : hoge@hoge.com  
パスワード : a111111  

## 利用方法

パフォーマー : 新規登録、ログイン後にプロフィールの投稿、編集、削除ができます。 

ユーザー : 新規登録、ログイン後に投稿画像の詳細ページにて依頼したいパフォーマーのツィッターアカウントの確認ができます。  

ログイン者(共通) : プロフィール投稿の詳細ページにて質問コメント機能を搭載しています。トップページの投稿画像から気になるパフォーマーをお気に入り登録が可能です。検索機能の利用ができます。

未ログインユーザー : 一部の投稿情報の確認、質問コメントの閲覧、検索機能の利用ができます。

## 課題解決
優れた技術を持ったパフォーマーでも、認知されないと仕事の依頼が増えないのではないかと考えました。
パフォーマーが、企業や一般の人とつながり依頼受ける為の橋渡しができるサイトがあれば便利ではないかと思い作成しました。 

## 使用したプログラミング言語

: Ruby 2.6.6  
: Ruby on Rails 6.0.0  


## トップ画面 

・ トップ画面全体

[![Image from Gyazo](https://i.gyazo.com/cbc5487d0e4f3b6c095d327a40a2d3ce.gif)](https://gyazo.com/cbc5487d0e4f3b6c095d327a40a2d3ce)

## 機能一覧

・ 新規登録 ログイン機能(devise)  

[![Image from Gyazo](https://i.gyazo.com/da795e5e08f138d33dbb047ec82a8063.png)](https://gyazo.com/da795e5e08f138d33dbb047ec82a8063)

[![Image from Gyazo](https://i.gyazo.com/eb8ccb936b9ecfe9a830a14c4e26e360.png)](https://gyazo.com/eb8ccb936b9ecfe9a830a14c4e26e360)

・  プロフィール画像投稿機能(active storage) 

[![Image from Gyazo](https://i.gyazo.com/a8cb7b6a219b27796d050e600090ff27.png)](https://gyazo.com/a8cb7b6a219b27796d050e600090ff27)

・  お気に入り登録機能 (ajax)  

[![Image from Gyazo](https://i.gyazo.com/0f33af9e81085c763398cc9ec3e2ad4c.gif)](https://gyazo.com/0f33af9e81085c763398cc9ec3e2ad4c)

・  質問機能 (ajax)  

[![Image from Gyazo](https://i.gyazo.com/4a4f3b967d9bbd44736b2367184ab525.gif)](https://gyazo.com/4a4f3b967d9bbd44736b2367184ab525)

・  検索機能 (ransack) (active_hash)  

[![Image from Gyazo](https://i.gyazo.com/5424112ecf770e96fed97c202d7e3def.gif)](https://gyazo.com/5424112ecf770e96fed97c202d7e3def)


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








