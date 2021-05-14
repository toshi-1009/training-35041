# README

# アプリケーション名
トレーニング習慣化アプリケーション

# アプリケーションの概要
目標の設定、実施記録を付けることを行うことで実施してきたトレーニング内容を可視化することにより、トレーニングを習慣化させ、目標達成をサポートしてくれるアプリケーションです。

# URL
https://training-35041.herokuapp.com/

# 利用方法
1.ログイン、または新規登録をします。  
2.目標設定をします。  
3.実施したトレーニング内容、それに関するコメントを入力します。  
4.トップページで一覧を確認することができます。  

# 目指した課題解決
1.一日の中で、トレーニングに当てる時間の確保ができていないという課題。  
2.効果的な練習メニューを設定できていないという課題。  
3.練習を習慣化できていないという課題。  
4.練習の振り返りができないという課題。  
これらの課題を解決するために、アプリ作成に取り掛かりました。  

# 洗い出した要件
1.ユーザー管理機能  
2.実施記録保存機能 
3.一覧表示機能  
4.詳細表示機能  
5.編集機能  
6.削除機能  
7.目標設定機能  
# 実装した機能について
・ユーザー管理機能
ログイン状態に合わせて、「ログイン/ログアウト/新規登録」ボタンを表示します。
新規登録し、ログインすることにより、ユーザーごとにデータを管理することができます。  
[![Image from Gyazo](https://i.gyazo.com/173fba7a44588153a497d3955c3beb0b.png)](https://gyazo.com/173fba7a44588153a497d3955c3beb0b)
[![Image from Gyazo](https://i.gyazo.com/46ad98cf9366ae95b9cee0f26e4238fa.png)](https://gyazo.com/46ad98cf9366ae95b9cee0f26e4238fa)  
  
・実施記録保存機能
入力フォームに実施したトレーニング内容を入力し、保存することができる。  
項目として、トレーニングの種類（カテゴリー）、具体的なトレーニング内容、評価コメントを保存することができます。
[![Image from Gyazo](https://i.gyazo.com/0b4e652a21bad51152f5ab2105f8b4fa.gif)](https://gyazo.com/0b4e652a21bad51152f5ab2105f8b4fa)

・編集機能
[![Image from Gyazo](https://i.gyazo.com/140a8e9d9676d40d342b59257a2b9387.gif)](https://gyazo.com/140a8e9d9676d40d342b59257a2b9387)

・削除機能
[![Image from Gyazo](https://i.gyazo.com/647a43b6dcc9605e6ad965b78f4e920a.gif)](https://gyazo.com/647a43b6dcc9605e6ad965b78f4e920a)

# 実装予定の機能について
・目標設定機能  
目標を設定して、それに向けてトレーニングを継続することができるようにする。  
目標設定では、目標だけでなく、それを達成するために決めた行動を「いつやるか」,
また目標を達成した時の「報酬」を設定することで、行動意欲の向上、習慣化につながりやすくしています。

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
has_one :target

## trainingsテーブル

|colum                 | Type       | Options           |
| ---------------------|----------- |------------------ |
| category_id          | integer    | null: false       |
| training_menu        | text       | null: false       |
| comment              | text       | null: false       |
| user                 | references | foreign_key: true |
 
### Association
belongs_to :user

## targetsテーブル
|colum      | Type       | Options           |
| ----------| -----------|-------------------|
| target    | text       | null: false       |
| timing    | text       | null: false       |
| activity  | text       | null: false       |
| reward    | text       | null: false       |
| user      | references | foreign_key: true |

### Association
belongs_to :user