class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :horses, dependent: :destroy
  has_many :instructors, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_one_attached :icon

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 100 }

  GUEST_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
    end
  end

  def guest?
    email == GUEST_EMAIL
  end
end
