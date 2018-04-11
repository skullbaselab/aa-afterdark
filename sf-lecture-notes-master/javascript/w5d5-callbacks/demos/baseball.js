class Baseball {
  constructor() { 
    this.name = "baseball";
   }

  homerun() { 
    console.log("HOMER!");
   }
}

class Homefield {
  constructor(name) {
    this.name = name;
  }
}

module.exports = { Baseball, Homefield };