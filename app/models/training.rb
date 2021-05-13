class Training < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :user
 has_many :comments

  with_options presence: true do
    validates :date
    validates :category_id, numericality: { other_than: 1 }
    validates :training_menu, length:{ maximum: 1000}
  end
  validates :comment, length:{ maximum: 1000}

end
