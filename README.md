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

## usersテーブル

|colum               | Type    | Options                   |
| -------------------|-------- |-------------------------- |
| nickname           | string  | nul: false                |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association
has_many :trainings
has_many :comments
has_one :target

## trainingsテーブル

|colum                 | Type       | Options           |
| ---------------------|----------- |------------------ |
| category_id          | integer    | null: false       |
| training_menu        | text       | null: false       |
| point                | text       | null: false       |
| evaluation           | text       | null: false       |
| user                 | references | foreign_key: true |
| comment              | references | foreign_key: true |
 
### Association
belongs_to :user
belongs_to :comment

 ## commentsテーブル
|colum    | Type       | Options           |
| --------|----------- |------------------ |
| comment | text       |                   |
| user    | references | foreign_key: true |

### Association
belongs_to :user
has_many :trainings

## targetsテーブル
|colum                   | Type       | Options           |
| -----------------------| -----------|-------------------|
| long_term_goal         | text       | null: false       |
| intermediate_term_goal | text       | null: false       |
| short_term_goal        | text       | null: false       |
| cause                  | text       | null: false       |
| timing                 | text       | null: false       |
| rule                   | text       | null: false       |
| reward_long            | text       | null: false       |
| reward_intermediate    | text       | null: false       |
| reward_short           | text       | null: false       |
| user                   | references | foreign_key: true |

### Association
belongs_to :user