class SongsController < ApplicationController
  require 'json'
  require 'open-uri'

  def index         # GET /restaurants
    @user = User.find(current_user.id)
    @songs = @user.songs
    send_welcome_email
  end

  def show          # GET /songs/:id
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    # @user = User.find(params[:user_id])
  end

  def create        # POST /songs
    if params[:track]
      song_artist = params[:track][:artist_name]
      song_track = params[:track][:track_name]
      song_url = params[:track][:track_share_url]

    else
      song_artist = params["song"]["artist"]
      song_track = params["song"]["title"]
    end

    @user = User.find(current_user.id)
    @song = Song.new(title: song_track, artist: song_artist, url: song_url)
    @song.user = current_user
    @song.title = song_track
    @song.artist = song_artist
    @song.url = song_url

    if @song.save
      redirect_to user_songs_path(current_user)
    else
      render :new
    end
  end

  def search
    artist = params[:song][:artist]
    track = params[:song][:title]
    apikey = ENV["MUSICXMATCH"]
    url = "http://api.musixmatch.com/ws/1.1/track.search?q_artist=#{artist}&page_size=20&page=1&s_track_rating=desc&apikey=#{apikey}&q_track=#{track}"
    songs_serialized = open(url).read
    @songs = JSON.parse(songs_serialized)["message"]["body"]["track_list"]
    @song = Song.new
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
    params.require(:song).permit(:title, :artist, :url)
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
  
end
