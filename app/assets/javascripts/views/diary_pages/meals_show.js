window.App.Views.Meals = Backbone.CompositeView.extend({
	tagName: "tr",
	className: "data-entry",
	template: JST["diary_pages/meals"],
	initialize: function(options) {
		// this.model = options.model
		this.pageId = options.pageId,
		this.pageShow = options.pageShow
	},
	render: function() {
		var renderedContent = this.template({
			food: this.model
		})
		this.$el.html(renderedContent);
		this.$("button.delete-diary-entry").attr("data-food_id", this.model.id)
		this.$("button.delete-diary-entry").attr("data-page_id", this.pageId)
		return this;
	},
	events: {
		"click button.delete-diary-entry": "deleteDiaryEntry"
	},
	deleteDiaryEntry: function(event) {
		var that = this;
		event.preventDefault();
		var foodId = $(event.currentTarget).data("food_id");
		var pageId = $(event.currentTarget).data("page_id");
		this.model.destroy()
	}
})