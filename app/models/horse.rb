class Horse < ApplicationRecord
  belongs_to :user
  belongs_to :color, optional: true

  validates :name, presence: true, length: { maximum: 20 }
end
