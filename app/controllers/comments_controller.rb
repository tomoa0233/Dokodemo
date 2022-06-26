class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @comment = Comment.create(comment_params)
    @comment.shop_id = params[:shop_id]
    @comment.user_id = current_user.id
    @comments = Comment.all
    if @comment.save
      render :create
    else
      render :error
    end

    # if @comment.save
    #   redirect_to shop_path(params[:shop_id])
    # else
    #   render :new
    # end
  end

  def index
    @comment = Comment.new

    @shop = Shop.find(params[:shop_id])
    @comments = @shop.comments.includes(:liked_users).sort { |a, b| b.liked_users.size <=> a.liked_users.size }
  end

  def destroy
    @comment = Comment.find(params[:id])
    @shop_id = @comment.shop_id
    @comment.destroy
    render :create
    # redirect_to shop_path(@shop_id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
