module Api
  class PhotosController < ApiController
    def index
      @photos = Photo.includes(:likes)
      if signed_in?
        @likes_hash = current_user.photo_likes_hash
      else
        @likes_hash = {}
      end
      render :index
    end

    def show
      @photo = Photo.includes(:likes).find(params[:id])
      @likes_hash = {}
      if signed_in?
        @likes_hash[@photo.id] = @photo.likes.find_by(user_id: current_user.id)
      end
      render :show
    end
  end
end
