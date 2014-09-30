App.Views.SocialProfileShow = Backbone.CompositeView.extend({
	template: JST["social_profile/show"],
	initialize: function(options) {
		this.currentUser = options.user
	},
	render: function() {
		var renderedContent = this.template({
			currentUser: this.currentUser,
			profile: this.model
		});
		this.$el.html(renderedContent);
		this.renderFeed();
		return this;
	},
	
  renderFeed: function() {
    var feedView = new App.Views.NewsFeedView({
    	currentUser: this.currentUser,
    });
    this.appendChildTo(feedView, this.$(".my-progress"))
  }
})