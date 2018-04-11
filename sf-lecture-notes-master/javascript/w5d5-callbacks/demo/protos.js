function ProtoHuman(name, age) {
  this.name = name;
  this.age = age;
}

ProtoHuman.prototype.birthday = function() {
  this.age++;
};

const dallas = new ProtoHuman("dallas", 100);
console.log(dallas.age);
dallas.birthday();
console.log(dallas.age);