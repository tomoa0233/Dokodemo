class ShopTag < ApplicationRecord
  has_many :shops, dependent: :destroy
  has_many :tags, dependent: :destroy
end
