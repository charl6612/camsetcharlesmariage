class PhotosController < ApplicationController
  def index         # GET /restaurants
    @photos = Photo.all
    @user = User.find(params[:user_id])
    email = @user.email

    url = "http://res.cloudinary.com/dsp2exmo1/image/list/#{email}.json"
    photos_serialized = open(url).read
    @photos = JSON.parse(photos_serialized)["resources"]
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
      redirect_to user_photos_path
    else
      render :new
    end
    redirect_to user_photos_path
  end

  def edit          # GET /articles/:id/edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to user_photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:url)
  end
end
