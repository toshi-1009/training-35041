# README

# アプリケーション名
training管理アプリケーション

# アプリケーションの概要

# URL

# 利用方法

# 目指した課題解決

# 洗い出した要件

# 実装した機能について

# 実装予定の機能について

# データベース設計

# ローカルでの動作方法

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
| user                 | references | foreign_key: true |
 
### Association
belongs_to :user
has_one :comment

 ## commentsテーブル
|colum      | Type       | Options           |
| ----------|----------- |------------------ |
| comment   | text       |                   |
| user      | references | foreign_key: true |
| training  | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :training

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