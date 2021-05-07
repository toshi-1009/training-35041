# README

# アプリケーション名
training管理アプリケーション

# アプリケーションの概要
目標の設定、その目標達成のために行うトレーニングメニューの設定を行い、それらを管理することにより、トレーニングを習慣化させ、目標達成をサポートしてくれるアプリケーションです。

# URL
https://training-35041.herokuapp.com/

# 利用方法
1.ログイン、または新規登録をします。
2.目標設定をします。
3.目標達成に向けてトレーニングメニューを設定します。
4.実施したトレーニングについては、評価コメントをいれ、振り返りをする。

# 目指した課題解決
1.一日の中で、トレーニングに当てる時間の確保ができていないという課題。
2.効果的な練習メニューを設定できていないという課題。
3.練習を習慣化できていないという課題。
4.練習の振り返りができないという課題。
これらの課題を解決するために、アプリ作成に取り掛かりました。

# 洗い出した要件
1.ユーザー管理機能
2.トレーニング設定機能
3.一覧表示機能
4.詳細表示機能
5.編集機能
6.削除機能
7.目標設定機能
8.評価コメント機能
# 実装した機能について
・ユーザー管理機能
ログイン/ログアウト、新規登録をすることができます。
新規登録：
[![Image from Gyazo](https://i.gyazo.com/01eb79db615146ad75858691ef740203.gif)](https://gyazo.com/01eb79db615146ad75858691ef740203)
ログイン：
[![Image from Gyazo](https://i.gyazo.com/1b97a6ad38be8ff04d40ea296f8d98b4.gif)](https://gyazo.com/1b97a6ad38be8ff04d40ea296f8d98b4)
ログアウト：
[![Image from Gyazo](https://i.gyazo.com/4c1c8581dcdaaa3740cb235793b3ada2.gif)](https://gyazo.com/4c1c8581dcdaaa3740cb235793b3ada2)

・新規登録ができる。"
・トレーニング設定機能
入力フォームにトレーニング内容を入力し、設定することができる。
項目として、トレーニングの種類（カテゴリー）、具体的なトレーニング内容を設定することができる。
トレーニング実施後の評価コメントを入力することができる。
入力後、保存する為の「設定」のボタンが表示される。
[![Image from Gyazo](https://i.gyazo.com/bfa343418635d0c246c2be2b1696357a.gif)](https://gyazo.com/bfa343418635d0c246c2be2b1696357a)

# 実装予定の機能について
・一覧表示機能
設定したトレーニング内容、実施結果、評価コメント、目標設定を一覧で表示することで、トレーニングの実施状況について確認できるようにする。
・詳細表示機能
トレーニング内容の詳細、評価コメントについて表示し、それぞれについて編集、削除ができるようにする。
・編集機能
設定したトレーニング内容、評価コメントを削除することができるようにする。
・削除機能
設定したトレーニング内容、評価コメントを削除することができるようにする。
・目標設定機能
目標を設定して、それに向けてトレーニングを継続することができるようにする。
また、目標を短期、中期、長期と分けたり、いつトレーニングを行うか、目標達成時の報酬などを予め設定して、継続してトレーニングが行えるように動機付けをしていく。
・評価コメント機能
実施したトレーニングについてコメントで記録を残す。
# データベース設計
ER図参照
[![Image from Gyazo](https://i.gyazo.com/79a9cf6440bc9ed90286d9dc3c809382.png)](https://gyazo.com/79a9cf6440bc9ed90286d9dc3c809382)

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

# ローカルでの動作方法
git clone https://github.com/toshi-1009/training-35041.git
rails db:create
rails db:migrate