function PopStar(name, song) {
  this.name = name;
  this.song = song;
}

function AcousticHipsterBand(name, song) {
  this.name = name;
  this.song = song;
}

AcousticHipsterBand.prototype.sing = function sing() {
  console.log(`${this.name} sings ${this.song}`);
}

const chad = new AcousticHipsterBand('chad', 'no songs');






const loggins = new PopStar('Kenny', 'Danger Zone!');

// give loggins the ability to sing

// give chad the ability to channel his inner loggins