const APIUtil = require('./api_util');

const FollowToggle = require('./follow_toggle');

class UsersSearch {
  constructor(el) {
    // this.$el = $(el);
    this.input = el.querySelector('input[name=username]');
    this.ul = el.querySelector(".users");
    // this.$input = this.$el.find("input[name=username]");
    // this.$ul = this.$el.find(".users");
    this.input.addEventListener('input', this.handleInput.bind(this));
    // this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(event) {
    if (this.input.value === "") {
      this.renderResults([]);
      return;
    }
    APIUtil.searchUsers(this.input.value)
      .then(users => this.renderResults(users));
  }

  renderResults(users) {
    this.ul.innerHTML = '';

    for (let i = 0; i < users.length; i++) {
      let user = users[i];


      let a = document.createElement('a');
      a.textContent = user.username;
      a.setAttribute("href", `/users/${user.id}`);

      let followToggle = document.createElement("button");
      new FollowToggle(followToggle, {
        userId: user.id,
        followState: user.followed ? "followed" : "unfollowed"
      });

      let li = document.createElement("li");
      li.appendChild(a);
      li.appendChild(followToggle);

      this.ul.appendChild(li);
    }
  }
}

module.exports = UsersSearch;
