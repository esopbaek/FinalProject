window.App.Views.PostsIndex = Backbone.CompositeView.extend({
  className: 'feed-posts',
  initialize: function() {
    this.listenTo(this.collection, "sync add remove", this.render)
  },

  render: function() {
		var that = this;
		this.$el.empty();
    this.collection.each(function (post) {
      var postsShow = new App.Views.PostsShow({ model: post })
      that.prependChildTo(postsShow, that.$el)
    });
    return this;
  }
});