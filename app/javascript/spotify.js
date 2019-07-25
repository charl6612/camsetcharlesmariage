if (document.querySelector(".spotify-search")) {
  const search2 = document.querySelector(".enter-search-sportify");
  const search = document.querySelector(".go-search-sportify");
  search.addEventListener("click", (event) => {
    searchSong(search2.value)
    console.log(search2.value);
  });


  const searchSong = (query) => {
    console.log(query);
    url = `https://api.spotify.com/v1/search?q=${query}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
  }
}