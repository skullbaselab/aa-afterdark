// debugger
$(() => {
  $("li").addClass("happy");
  addEventHandlers();
});

const newSquare = () => {
  const $newLi = $("<li>");
  $newLi.addClass("happy");
  $("#main").append($newLi);
};

const addEventHandlers = () => {
  $("#main").on("click", "li", (e) => {
    // debugger
    $(e.target).toggleClass("happy sad");
  });
  $("body").on("keypress", (e) => {
    if (e.key === "n") {
      newSquare();
    }
  });
};
