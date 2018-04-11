(function () {
  if (typeof NameApp === "undefined") {
    window.NameApp = {};
  }

  $.NameSearch = function (el) {
    this.$el = $(el);
    this.$input = this.$el.find("input[name=query]");
    this.$ul = this.$el.find("ul.names");

    this.$input.on("input", this.render.bind(this));
    this.render();
  };

  $.NameSearch.prototype.searchResults = function () {
    return NameApp.Name.search(this.$input.val());
  };

  $.NameSearch.prototype.render = function () {
    this.$ul.empty();

    this.searchResults().forEach((function (name) {
      var $li = $("<li>");
      $li.text(name.fullName());
      this.$ul.append($li);
    }).bind(this));
  };

  $.fn.nameSearch = function () {
    return this.each(function () {
      new $.NameSearch(this);
    });
  }
})();

$(function () {
  $('.name-search').nameSearch();
});
