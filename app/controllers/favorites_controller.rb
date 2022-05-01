class FavoritesController < ApplicationController
 def create
   comment = Comment.find(params[:comment_id])
   favorite = current_user.favorites.new(comment_id: comment.id)
   favorite.save
   redirect_to shop_comments_path(shop_id: comment.shop_id)
 end

 def destroy
   comment = Comment.find(params[:comment_id])
   favorite = current_user.favorites.find_by(comment_id: comment.id)
   favorite.destroy
   redirect_to shop_comments_path(shop_id: comment.shop_id)
 end
end
