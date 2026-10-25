class Horse < ApplicationRecord
  belongs_to :user
  belongs_to :color, optional: true
  has_many :lessons, dependent: :nullify
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
end
