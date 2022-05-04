class ShopsController < ApplicationController

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all
    # where(published: true)
    @tags = Tag.first(5)
  end

  def show
    @shop = Shop.find(params[:id])
    @comment_latest3 = Comment.first(3)
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
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :shop_hp, :telephone, :email, :introduction, :image, tag_ids: []).merge(user_id: current_user.id)
  end

end
