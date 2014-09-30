window.App.Views.PostsIndex = Backbone.CompositeView.extend({
  className: 'feed-posts',
  initialize: function(options) {
		this.user = options.user;
		this.currentUser = options.currentUser;
    this.listenTo(this.collection, "sync add remove", this.render)
  },

  render: function() {
		var that = this;
		this.$el.empty();
    this.collection.each(function (post) {
      var postsShow = new App.Views.PostsShow({ 
				model: post, 
				user: that.user,
				currentUser: that.currentUser
			})
      that.prependChildTo(postsShow, that.$el)
    });
    return this;
  }
});