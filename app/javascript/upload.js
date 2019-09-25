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
      uploadok(result.event)
    }
  }


  )

  document.getElementById("upload_widget").addEventListener("click", function () {
    myWidget.open();
  }, false);

}

function uploadok(result) {
  if (document.getElementById("confirmation_test")){
    node = document.getElementById("confirmation_test")
    node.remove()
  }

  if (result === "success") {
    const place = document.querySelector(".container-form");
    place.insertAdjacentHTML('beforeend',
      `<div class="row justify-content-md-center" style="text-align: center" id="confirmation_test">Importation réussie. La mise à jour prend quelques minutes et nécessite un rechargement de la page</div>`
    )
  }
}