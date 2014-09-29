App.Views.SocialProfileShow = Backbone.View.extend({
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
		return this;
	},
})