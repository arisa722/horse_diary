class Instructor < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :nullify

  validates :name, presence: true, length: { maximum: 20 }
end
