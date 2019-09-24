if (document.getElementById("upload_widget")) {
  var email = document.getElementById("upload_widget").dataset.user;


  var myWidget = cloudinary.createUploadWidget({

    cloudName: 'dsp2exmo1',
    sources: ['local', 'url', 'image_search', 'camera'],
    folder: "mariage",
    tags: ["mariage", email],
    uploadPreset: 'lzscndb0'
  }, (error, result) => {
    if (!error && result && result.event === "success") {
    }
  }


  )

  document.getElementById("upload_widget").addEventListener("click", function () {
    myWidget.open();
  }, false);

}