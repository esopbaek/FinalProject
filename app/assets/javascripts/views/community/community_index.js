App.Views.Community = Backbone.View.extend({
	template: JST["users/index"],
	render: function() {
		var renderedContent = this.template({
			users: this.collection
		})
		this.$el.html(renderedContent);
		return this
	},
	
})