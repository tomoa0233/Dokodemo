class Tag < ApplicationRecord
  has_many :shop_tags
  has_many :shops, through: :shop_tags

  scope :from_x_second_ago, -> (second) { where("tags.created_at < ?", second) }

  validates :name, length: { in: 1..20 }
end
