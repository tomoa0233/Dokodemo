class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum age: {
    less_fifty: 0,
    fifty: 1,
    sixty: 2,
    seventy: 3,
    eighty: 4,
    ninety: 5,
    over_ninety: 6,
  }

  enum sex: {
    man: 0,
    woman: 1,
  }

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :comment
  has_many :shops, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :age, presence: true
  validates :sex, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :telephone, presence: true, format: { with: VALID_PHONE_REGEX }
end
