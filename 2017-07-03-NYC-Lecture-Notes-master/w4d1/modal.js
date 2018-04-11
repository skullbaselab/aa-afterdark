document.addEventListener("DOMContentLoaded", function() {
  const modal = document.getElementById("modal-backdrop");
  modal.addEventListener("click", function(e) {
    e.currentTarget.classList.add("hide");
  });
  const form = document.querySelector("#modal-backdrop form");
  form.addEventListener("click", function(e) {
    e.stopPropagation();
  });
});
