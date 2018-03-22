class FollowToggle {
  constructor(el) {
    // $el is a jQuery object
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');

    this.$el.on('click', this.handleClick.bind(this));
    this.render();
  }

  render() {
    if(this.followState === "followed") {
      this.$el.text("Unfollow");
    } else {
      this.$el.text("Follow");
    }
  }

  handleClick(event) {
    const that = this;
    let sendMethod = null;
    event.preventDefault();

    if (this.followState === 'unfollowed') {
      sendMethod = 'POST';
      this.followState = 'followed';
    } else if (this.followState === 'followed') {
      sendMethod = 'DELETE';
      this.followState = 'unfollowed';
    }
    this.$el.prop('disabled', true);


    $.ajax({
      url: `/users/${this.userId}/follow`,
      method: sendMethod,
      dataType: 'json'
    }).then( () => {this.$el.prop('disabled', false);} );

    this.render();
  }
}

module.exports = FollowToggle;
