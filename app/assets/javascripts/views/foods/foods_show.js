window.App.Views.FoodsShow = Backbone.CompositeView.extend({
	template: JST["foods/show"],
	tagName: "li",
	className: "food-list",
	initialize: function(options) {
		this.pageId = options.pageId
		this.meal = options.meal;
		this.$el.attr('data-food_name', this.model.get("name"));
		this.$el.attr('data-brand_name', this.model.get("brand"));
	},
	
	events: {
		"click": "showNutrition"
	},
	
	render: function() {
		this.$el.html(this.model.get("name") + " - " + this.model.get("brand"));
		return this;
	},
	
	showNutrition: function(event) {
		var view = this;
		var nutritionShow = new App.Views.NutritionShow({
			pageId: this.pageId,
			model: this.model,
			meal: this.meal
		});
	
		App.Collections.foods.fetch({
			success: function(collection) {
				var foods = collection;
				var chosenFoods = collection.where({name: view.model.get("name"), brand: view.model.get("brand")})
				if (chosenFoods.length < 1) {
					var newFood = new App.Models.Food({"food": view.model.attributes});
					newFood.save({}, {
						success: function() {
							App.Collections.foods.add(newFood)
						}
					})
				};
			}, 
		});
		this.renderChildInto(nutritionShow, $("div.nutrition-label"))
	}
	

})