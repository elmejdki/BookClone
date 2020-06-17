class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :messages
  has_many :posts, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many :friendships
  # has_many :friends, through: :friendships, classname: 'User'
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true, format: Devise.email_regexp
end
