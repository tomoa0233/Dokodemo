class ShopsController < ApplicationController
 before_action :find_shop, :only => [:show, :edit, :update, :destroy]

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all
    @tags = Tag.first(5)
  end

  def show
    @comment_latest3 = @shop.comments.first(3)
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      @shop.save_tags(params[:shop][:tag])
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  def find_shop; @shop = Shop.find(params[:id]); end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :shop_hp, :telephone, :email, :introduction, :image, tag_ids: []).merge(user_id: current_user.id)
  end
end
