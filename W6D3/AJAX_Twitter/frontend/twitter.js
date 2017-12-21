let FollowToggle = require("./follow_toggle.js");

$( () => {
  $(".follow-toggle").each((i, btn) => new FollowToggle(btn,{}));

});
