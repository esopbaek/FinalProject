window.App.Views.FoodDiaryShow = Backbone.CompositeView.extend({
	template: JST["diary_pages/show"],
	initialize: function(){
		this.listenTo(this.model, "sync", this.render)
	},	
	render: function() {
		var renderedContent = this.template({
			page: this.model
		});
		this.$el.html(renderedContent);
		this.renderBreakfasts();
		this.renderLunches();
		this.renderDinners();
		this.renderSnacks();
		return this;
	},
	
	renderBreakfasts: function() {
		var that = this;
		this.model.breakfasts().fetch({wait: true})
		this.model.breakfasts().each(function (breakfast) {
			var breakfastsShow = new App.Views.Meals({
				model: breakfast
			});
			var breakfastsContainer = that.$("tbody#breakfasts");
			that.appendChildTo(breakfastsShow, breakfastsContainer);
		})
	},
	
	renderLunches: function() {
		var that = this;
		this.model.lunches().fetch({wait: true})
		this.model.lunches().each(function (lunch) {
			var lunchesShow = new App.Views.Meals({
				model: lunch
			});
			var lunchesContainer = that.$("tbody#lunches");
			that.appendChildTo(lunchesShow, lunchesContainer);
		})
	},
	
	renderDinners: function() {
		var that = this;
		this.model.dinners().fetch({wait: true})
		this.model.dinners().each(function (dinner) {
			var dinnersShow = new App.Views.Meals({
				model: dinner
			});
			var dinnersContainer = that.$("tbody#dinners");
			that.appendChildTo(dinnersShow, dinnersContainer);
		})
	},
	renderSnacks: function() {
		var that = this;
		this.model.snacks().fetch({wait: true})
		this.model.snacks().each(function (snack) {
			var snacksShow = new App.Views.Meals({
				model: snack
			});
			var snacksContainer = that.$("tbody#snacks");
			that.appendChildTo(snacksShow, snacksContainer);
		})
	},

	
	
})