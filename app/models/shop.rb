class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_tag
end
