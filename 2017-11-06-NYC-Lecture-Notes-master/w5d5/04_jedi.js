
class Jedi {
  constructor(name, alignment) {
    this.name = name;
    this.alignment = alignment;
    this.inventory = [];
  }

  readySaber() {
    console.log(`${this.name} has activated their saber!`);
  }

  meditate(verb) {
    console.log(`${this.name} is meditating...`);
    window.setTimeout(force, 3000);

    function force() {
      console.log(`${verb} the ${this.alignment} side, ${this.name}!`);
      this.readySaber();
    }
  }

  addItem(item) {
    this.inventory.push(item);
  }

  listInventory() {
    this.inventory.forEach( function(item) {
      console.log(`${this.name} has a ${item}!`);
    });
  }
}
