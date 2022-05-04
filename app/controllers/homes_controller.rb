class HomesController < ApplicationController
  def top
    @shop_latest6 = Shop.first(6)
    @tags = Tag.first(5)
  end
end
