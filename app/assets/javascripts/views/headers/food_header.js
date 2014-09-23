window.App.Views.FoodHeader = Backbone.View.extend({
		template: JST["navbar/food_header"],
		render: function() {
	    var renderedContent = this.template();
	    this.$el.html(renderedContent);
	    return this;
		}
})