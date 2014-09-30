App.Views.SocialProfileEdit = Backbone.View.extend({
	template: JST["social_profile/edit"],
	events: {
		"submit form.edit-profile": "submit"
	},
	render: function() {
		var renderedContent = this.template({
			profile: this.model
		});
		this.$el.html(renderedContent);
		return this;
	},
	
  submit: function(event) {
		var that = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var profile = this.model;
		profile.save(params, {
			url: "/api/social_profile", 
			success: function(){
				Backbone.history.navigate("users/" + that.model.user.id + "/social_profile", {trigger: true})
			}});
	}
})