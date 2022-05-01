class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # shop = Shop.find(params[:shop_id])
    @comment = Comment.new(comment_params)
    # binding.irb
    @comment.shop_id = params[:shop_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to shop_path(params[:shop_id])
    else
      render :new
    end
  end

  def index
    @comments = Comment.all

  end

  def edit

  end

  # def show
  # end

  def update
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to shop_path(@shop)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
