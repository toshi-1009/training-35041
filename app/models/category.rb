class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '休養' },
    { id: 3, name: 'ジョグ' },
    { id: 4, name: 'LSD' },
    { id: 5, name: 'スピード練習' },
    { id: 6, name: 'インターバル練習' },
    { id: 7, name: 'ロング走練習' },
    { id: 8, name: 'ペース走練習' },
    { id: 9, name: 'ビルドアップ走練習' },
    { id: 10, name: '筋力トレーニング' }
  ]

  include ActiveHash::Associations
  has_many :trainings

  end