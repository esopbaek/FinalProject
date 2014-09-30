window.App.Models.SocialProfile = Backbone.Model.extend({
	initialize: function(attributes, options) {
		this.user = options.user
	},
	url: function() {
		return this.user.url() + "/social_profile"
	},
})