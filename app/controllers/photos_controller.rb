class PhotosController < ApplicationController
  def index         # GET /restaurants
    @photos = Photo.all
  end

  def show          # GET /Photos/:id
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @user = User.find(params[:user_id])

  end

  def create        # POST /Photos
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photos = Photo.all
    if @photo.save
      redirect_to user_photos_path()
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to user_photos_path()
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_photos_path()
  end


  private

  def photo_params
    params.require(:photo).permit(:url)
  end

end