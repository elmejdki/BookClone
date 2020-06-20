class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  before_update :complete_friendship

  validates :user, uniqueness: { scope: :friend, message: 'you can\' have the same relationship multiple times' }

  private

  def complete_friendship
    Friendship.create(user_id: friend.id, friend_id: user.id, confirmed: true) if confirmed
  end
end