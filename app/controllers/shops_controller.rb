class ShopsController < ApplicationController

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all
    # where(published: true)
  end

  def show
    @shop = Shop.find(params[:id])
    @comment_latest3 = Comment.first(3)
  end

  def create
    @shop = Shop.new(shop_params)

    @shop.save
    tag = Tag.find(1)

    @shop.tags << tag
    # binding.pry
    redirect_to shop_path(@shop)
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :shop_hp, :telephone, :email, :introduction, :image).merge(user_id: current_user.id)
  end
end
