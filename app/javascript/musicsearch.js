const results = document.querySelector("#results");

fetch("https://api.musixmatch.com/ws/1.1/track.search?q_artist=Nirvana&s_track_rating=desc&apikey=a9b23f8894f7ea2c142c0e8dbedef804")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });


//   artist = params[:song][:artist]
//   track = params[:song][:title]
//   apikey = ENV["MUSICXMATCH"]
//   url = "http://api.musixmatch.com/ws/1.1/track.search?q_artist=#{artist}&page_size=10&page=1&s_track_rating=desc&apikey=#{apikey}&q_track=#{track}"
//   songs_serialized = open(url).read
//   song = JSON.parse(songs_serialized)["message"]["body"]["track_list"][0]
//   unless song.nil?
//     @song_url = song["track"]["track_share_url"]
//     @song_title = song["track"]["track_name"]
//     @song_artist = song["track"]["artist_name"]
//   end