const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = (this.$el.data("initial-follow-state") ||
                        options.followState);
    this.render();

    // this.$el.on("click", this.handleClick()); // this would set the callback to be the return value of this.handleClick()
    this.$el.on("click", this.handleClick.bind(this)); // bind-style
    // this.$el.on("click", (e) => this.handleClick(e)); // fat-arrow style
  }

  handleClick(event) {
    // const followToggle = this; // hmmm?

    // this event is attached to a button, which has no default
    // if this was on a form, we would want to prevent that submission/request
    // event.preventDefault(); // hrmmmm??

    if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(function() {
        // this is new scope, so we can close over followToggle
        // or use a fat arrow to capture 'this'
        // or bind the function to this

        this.followState = "unfollowed";
        this.render();
      }.bind(this));
    } else if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(function () {
        this.followState = "followed";
        this.render();
      }.bind(this));
    }
  }

  render() {
    switch(this.followState){
      case "followed":
        this.$el.prop("disabled", false);
        this.$el.html("Unfollow!");
        break;
      case "unfollowed":
        this.$el.prop("disabled", false);
        this.$el.html("Follow!");
        break;
      case "following":
        this.$el.prop("disabled", true);
        this.$el.html("Following...");
        break;
      case "unfollowing":
        this.$el.prop("disabled", true);
        this.$el.html("Unfollowing...");
        break;
    }
  }

}

module.exports = FollowToggle;
