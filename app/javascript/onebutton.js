

if (document.querySelector(".updatefullpresence")) {
  const maxbutton = document.querySelector(".updatefullpresence")

  maxbutton.addEventListener("click", (event) => {
    const forms = document.querySelectorAll(".edit_presence")
    forms.forEach((form) => {
      form.submit()
    });
  });

}