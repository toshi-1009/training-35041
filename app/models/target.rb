class Target < ApplicationRecord
  belongs_to :user
 

  with_options presence: true do
    validates :target
    validates :timing
    validates :activity
    validates :reward
  end
end
