App.Views.SocialProfileShow = Backbone.View.extend({
	template: JST["social_profile/show"],
	render: function() {
		var renderedContent = this.template({
			profile: this.model
		});
		this.$el.html(renderedContent);
		return this;
	},
})