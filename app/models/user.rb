class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :horses, dependent: :destroy
  has_many :instructors, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 100 }
end
