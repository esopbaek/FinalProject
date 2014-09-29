App.Models.CurrentUser = Backbone.Model.extend({
	url: "api/users/current_user"
})

App.Models.currentUser = new App.Models.CurrentUser();