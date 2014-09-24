window.App.Models.DietProfile = Backbone.Model.extend({
  urlRoot: "/api/diet_profile",
	// sync: function(method, model, options) {
// 		if (method == "update") {
// 			model.url = "/api/diet_profile"
// 			console.log(model.url())
// 			return
// 		}
// 		return Backbone.sync(method, model, options);
// 	}
})
