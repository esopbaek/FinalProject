App.Views.Community = Backbone.CompositeView.extend({
	template: JST["users/index"],
	initialize: function() {
		this.listenTo(this.collection, "sync", this.render)
	},
	events: {
		"submit form.search-user": "submit"
	},
	render: function() {
		var renderedContent = this.template({
			users: this.collection
		})
		this.$el.html(renderedContent);
		return this
	},
	submit: function(event) {
		var view = this;
		event.preventDefault();
		var query = $(event.currentTarget).serializeJSON()
		$.ajax({
			data: query,
			url: "api/users/search",
			success: function(resp) {
				view.$("ul.users-list").empty();
				_.each(resp, function(user) {
					var userShow = new App.Views.UserShow({
						model: user
					})
					view.appendChildTo(userShow, $("ul.users-list"))
				})
			}
		})
		console.log(this.users)
	}
	
	
})