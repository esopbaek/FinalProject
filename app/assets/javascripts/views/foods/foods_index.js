window.App.Views.FoodsIndex = Backbone.CompositeView.extend({
  template: JST["foods/index"],

  initialize: function(options) {
		this.meal = options.meal;
		this.pageId = options.pageId
  },

  events: {
    "submit form.search": "submit",
    "click li.food-list": "showNutrition"
  },

  render: function() {
    var renderedContent = this.template({ foods: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
		var that = this;
    event.preventDefault();
		
		this.$("div.results ul").empty();
    var query = $(event.currentTarget).serializeJSON()["query"];
		App.Collections.searchResults.fetch({
			data: {
				query: query
			}, 
			success: function(collection) {
				collection.each(function(food) {
					var showView = new App.Views.FoodsShow({
						model: food,
						meal: that.meal,
						pageId: that.pageId
					})
					that.appendChildTo(showView, that.$("div.results ul"))
				});
				if (collection.length == 0) {
					that.$("div.results ul").append("No foods match your search. Please try again")
				};
			}
		});
	}
});