let APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.options = options;
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    console.log("I'm working!");

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    console.log(this.followState);
    if (this.followState === "unfollowed") {
      this.$el.text("Follow");
    }
    else {
      this.$el.text("Unfollow");
    }
  }

  handleClick(event) {
    event.preventDefault();
    if (true) {
      //console.log(APIUtil);
      //console.log(APIUtil.followUser(this.userId));
      APIUtil.followUser(this.userId).then(
        ()=>{ console.log("first success"); },
        ()=>{ console.error("first error"); }
      ).then(
        ()=>{ console.log("second success"); },
        ()=>{ console.error("second error"); }
      ).fail(
        ()=>{ console.error("caught"); }
      );

    }
    else {
    }
  }
}


module.exports = FollowToggle;
