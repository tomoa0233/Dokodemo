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

  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :telephone, presence: true
end
