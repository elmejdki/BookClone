class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :posts
  # has_many :messages
  # has_many :comments
  # has_many :friendships
  # has_many :friends, through: :friendships, classname: 'User'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true, format: Devise.email_regexp
end
