(function () {
  if (typeof NameApp === "undefined") {
    window.NameApp = {};
  }

  var Name = NameApp.Name = function (attrs) {
    this.fname = attrs.fname;
    this.lname = attrs.lname;
  };

  Name.all = [
    new Name({ fname: "Curie", lname: "Ruggeri" }),
    new Name({ fname: "Markov", lname: "Ruggeri" }),
    new Name({ fname: "Breakfast", lname: "Watts-Rubens" }),
    new Name({ fname: "Earl", lname: "Watts-Rubens" }),
  ];

  Name.search = function (searchQuery) {
    searchQuery = searchQuery.toLowerCase();

    var results = []
    Name.all.forEach(function (name) {
      var fullName = name.fullName().toLowerCase();
      if (fullName.match(searchQuery)) {
        results.push(name);
      }
    });

    return results;
  };

  Name.prototype.fullName = function () {
    return [this.fname, this.lname].join(" ");
  };
})();
