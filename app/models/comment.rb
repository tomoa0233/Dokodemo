class Comment < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :liked_users, through: :favorites, source: :user

  belongs_to :shop
  
  validates :image, presence: true
  validates :body, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
