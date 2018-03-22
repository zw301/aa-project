const FollowToggle = require('./follow_toggle');
const UserSearch = require('./users_search');

$( () => {
  $('.follow-toggle').each( (idx, el) => {
    new FollowToggle(el);
  });

  let input = $('.users-search input')[0];
  new UserSearch(input);
});
