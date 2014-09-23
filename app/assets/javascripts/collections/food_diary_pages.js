window.App.Collections.FoodDiaryPages = Backbone.Collection.extend({
  url: "api/diarypages",
	model: App.Models.FoodDiaryPage
})