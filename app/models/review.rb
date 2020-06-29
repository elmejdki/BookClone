class Review < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { minimum: 1 }
end
