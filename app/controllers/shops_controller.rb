class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def index
  end

  def show
  end

  def create
    @shop = Shop.new(shop_params)
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :address, :shop_hp, :telephone, :email, :introduction, :image)
  end
end
