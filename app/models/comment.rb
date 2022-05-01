class Comment < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  belongs_to :shop

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

end

