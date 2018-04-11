var Cat = function(name) {
  this.name = name;
}

Cat.prototype.meowInTwoSeconds = function() {

  function meow() {
    console.log(this.name);
  };

  setTimeout(meow, 2000);
}


var gizmo = new Cat("Gizmo")

gizmo.meowInTwoSeconds();
