const APIUtil = require('./api_util');

const FollowToggle = require('./follow_toggle');

class UsersSearch {
  constructor(el) {
    this.el = el;
    this.input = this.el.querySelector("input[name=username]");
    this.ul = this.el.querySelector(".users");

    this.input.addEventListener("input", this.handleInput.bind(this));
  }

  handleInput(event) {
    if (this.input.value === "") {
      this.renderResults([]);
      return;
    }
    const promise = APIUtil.searchUsers(this.input.value)
    debugger
    const promise2 = promise.then(users => this.renderResults(users));
  }

  renderResults(users) {
    this.ul.innerHTML = ''; // kills the children

    for (let i = 0; i < users.length; i++) {
      let user = users[i];

      let a = document.createElement('a');
      a.textContent = user.username;
      a.setAttribute("href", `/users/${user.id}`);

      let followToggle = document.createElement('button');
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
