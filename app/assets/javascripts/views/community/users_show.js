App.Views.UserShow = Backbone.View.extend({
	tagName: "li",
	className: "users-list",
	template: JST["users/show"],
	events: {
		"submit form.search-user": "submit"
	},
	render: function() {
		var renderedContent = this.template({
			user: this.model
		})
		this.$el.html(renderedContent);
		return this;
	}
})