window.App.Views.FoodDiaryShow = Backbone.CompositeView.extend({
	template: JST["diary_pages/show"],
	initialize: function(){
		this.listenTo(this.model, "sync", this.render);
		
		this.listenTo(this.model.breakfasts(), "add remove", this.render);
		this.listenTo(this.model.lunches(), "add remove", this.render)
		this.listenTo(this.model.dinners(), "add remove", this.render)
		this.listenTo(this.model.snacks(), "add remove", this.render)
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
				model: breakfast,
				pageId: that.model.id,
				pageShow: that
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
				model: lunch,
				pageId: that.model.id,
				pageShow: that
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
				model: dinner,
				pageId: that.model.id,
				pageShow: that
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
				model: snack,
				pageId: that.model.id,
				pageShow: that
			});
			var snacksContainer = that.$("tbody#snacks");
			that.appendChildTo(snacksShow, snacksContainer);
		})
	},

	
	
})