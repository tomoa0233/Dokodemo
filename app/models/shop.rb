class Shop < ApplicationRecord
  belongs_to :user
  has_many :shop_tags
  has_many :tags, through: :shop_tags
  has_many :comments, dependent: :destroy

  attachment :image

end
