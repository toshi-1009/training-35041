class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings
  has_one :Target

  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password, length: { minimum: 6 }
  end
end
