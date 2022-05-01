class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  Fovorite.count.sort.rever
  # default_scope -> { order(favorite.count :desc) }
end
