class FavoritesController < ApplicationController
 before_action :authenticate_user!

 def index
  @favorites = current_user.favorites.order("created_at desc")
 end

 def destroy
   @favorite = Favorite.find(params[:id])
   if @favorite.blank? || @favorite.user_id != current_user.id
     flash[:notice] = "Cant delete favorited product"
     redirect_to favorites_path
   end
   if @favorite.delete
     flash[:notice] = "Cancel favorite succesful"
   else
     flash[:warning] = "Failed to delete favorite product"
   end
   redirect_to favorites_path
 end

end
