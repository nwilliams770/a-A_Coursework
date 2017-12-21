const APIUtil = {
  followUser: id => {
    return $.ajax({
    url: `/users/${id}/followqewfe`,
    type: 'POST',
    dataType: "json",
    // success() {
    //   console.log('You hare following this person');
    //   this.followState = "followed";
    //   //this.render();
    // }
    });
  },
  unfollowUser: id => {
    return $.ajax({
    url: `/users/${id}/follow`,
    type: 'DELETE',
    dataType: "json",
    // success() {
    //   console.log('You dropped that dirtbag');
    //   this.followState = "unfollowed";
    //   //this.render();
    // }
    });
  }
};

module.exports = APIUtil;
