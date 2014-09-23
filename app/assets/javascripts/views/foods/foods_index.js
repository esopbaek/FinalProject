window.App.Views.FoodsIndex = Backbone.CompositeView.extend({
  template: JST["foods/index"],

  initialize: function(options) {
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render);
  },

  events: {
    "submit form.search": "submit",
    "click li.list": "showNutrition"
  },

  render: function() {
    var renderedContent = this.template({ foods: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
		var that = this;
		
    event.preventDefault();
    var query = $(event.currentTarget).serializeJSON()["query"];
		App.Collections.searchResults.fetch({
			data: {
				query: query
			}, 
			success: function(collection) {
				collection.each(function(food) {
					var showView = new App.Views.foodsShow({
						model: food
					})
					that.appendChildTo(showView, that.$("div.results ul"))
				})
			}
		});
	}
	
});