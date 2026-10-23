class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :horse, optional: true
  belongs_to :instructor, optional: true

  has_many :lesson_categories, dependent: :destroy
  has_many :categories, through: :lesson_categories

  validates :date, presence: true
end
