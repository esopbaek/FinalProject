window.App.Views.Meals = Backbone.CompositeView.extend({
	tagName: "tr",
	className: "data-entry",
	template: JST["diary_pages/meals"],
	render: function() {
		var renderedContent = this.template({
			food: this.model
		})
		this.$el.html(renderedContent);
		return this;
	}
})