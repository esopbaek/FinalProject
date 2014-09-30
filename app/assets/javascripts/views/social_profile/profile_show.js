App.Views.SocialProfileShow = Backbone.CompositeView.extend({
	template: JST["social_profile/show"],
	initialize: function(options) {
		this.currentUser = options.currentUser;
		this.user = options.user;
		this.listenTo(App.Collections.users, "sync", this.render);
		this.listenTo(App.Models.currentUser, "sync", this.render);
	},
	render: function() {
		var renderedContent = this.template({
			user: this.user,
			profile: this.model
		});
		this.$el.html(renderedContent);
		this.renderFeed();
		return this;
	},
	
  renderFeed: function() {
    var feedView = new App.Views.NewsFeedView({
			user: this.user,
    	currentUser: this.currentUser
    });
    this.appendChildTo(feedView, this.$(".my-progress"))
  }
})