window.App.Views.FoodDiaryShow = Backbone.View.extend({
	template: JST["diary_pages/show"],
	render: function() {
		var renderedContent = this.template({
			
		});
		this.$el.html(renderedContent);
		return this;
	}
})