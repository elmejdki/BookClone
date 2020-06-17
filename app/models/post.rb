class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  def likes
    self.reactions.filter{ |reaction| reaction.like }.length
  end

  def dislikes
    self.reactions.filter{ |reaction| reaction.dislike }.length
  end
end
