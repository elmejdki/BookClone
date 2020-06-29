class Review < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { minimun: 1 }
end
