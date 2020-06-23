class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :user_id, presence: true
  validates :text, presence: true, length: { in: 1..200 }

  def likes
    self.reactions.filter{ |reaction| reaction.like }.length
  end

  def dislikes
    self.reactions.filter{ |reaction| reaction.dislike }.length
  end

  def liked(user)
    reaction = reactions.find_by(user_id: user.id)
    reaction.nil? ? false : reaction.like
  end

  def disliked(user)
    reaction = reactions.find_by(user_id: user.id)
    reaction.nil? ? false : reaction.dislike
  end

end
