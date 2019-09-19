class SongsController < ApplicationController
  require 'json'
  require 'open-uri'

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

  def search
    artist = params[:song][:artist]
    track = params[:song][:title]
    apikey = ENV["MUSICXMATCH"]
    url = "http://api.musixmatch.com/ws/1.1/track.search?q_artist=#{artist}&page_size=10&page=1&s_track_rating=desc&apikey=#{apikey}&q_track=#{track}"
    songs_serialized = open(url).read
    song = JSON.parse(songs_serialized)["message"]["body"]["track_list"][0]
    unless song.nil?
      @song_url = song["track"]["track_share_url"]
      @song_title = song["track"]["track_name"]
      @song_artist = song["track"]["artist_name"]
    end
  end

  def create        # POST /songs
    search
    @user = User.find(params[:user_id])
    @song = Song.new(song_params)
    @song.user = current_user
    unless @song_artist.nil?
      @song.title = @song_title
      @song.artist = @song_artist
      @song.url = @song_url
    end
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
