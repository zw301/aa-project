class UserSearch {
  constructor(el) {
    this.$el = $(el);
    this.value = this.$el.val();
    console.log(this.$el.parent().children());
  }


}

module.exports = UserSearch;
