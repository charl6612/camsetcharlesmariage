class SongsController < ApplicationController
  def index         # GET /restaurants
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end

  def show          # GET /songs/:id
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @user = User.find(params[:user_id])
  end

  def create        # POST /songs
    @user = User.find(params[:user_id])
    @song = Song.new(song_params)
    @song.user = current_user
    if @song.save
      redirect_to user_songs_path(current_user)
    else
      render :new
    end
  end

  def edit          # GET /articles/:id/edit
    @user = User.find(params[:user_id])
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    @user = User.find(params[:user_id])
    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to user_songs_path(current_user)
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

end
