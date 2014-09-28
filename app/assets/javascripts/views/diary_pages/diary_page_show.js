window.App.Views.FoodDiaryShow = Backbone.CompositeView.extend({
	template: JST["diary_pages/show"],
	initialize: function(){
		this.listenTo(this.model, "sync add change remove", this.render);
		
		this.listenTo(this.model.breakfasts(), "remove", this.render);
		this.listenTo(this.model.lunches(), "add remove", this.render)
		this.listenTo(this.model.dinners(), "add remove", this.render)
		this.listenTo(this.model.snacks(), "add remove", this.render)
		
	},	

	render: function() {
		var renderedContent = this.template({
			breakfastTotals: this.nutrientTotals(this.model.breakfasts()),
			lunchTotals: this.nutrientTotals(this.model.lunches()),
			dinnerTotals: this.nutrientTotals(this.model.dinners()),
			snackTotals: this.nutrientTotals(this.model.snacks()),
			dailyTotals: this.dailyNutrientTotals(),
			page: this.model
		});
		this.$el.html(renderedContent);
		this.renderBreakfasts();
		this.renderLunches();
		this.renderDinners();
		this.renderSnacks();

		return this;
	},
	
	calculateTotals: function(mealName, attrName) {
		if (mealName.length > 0){
		 return _.map(mealName.models, function(model) {
				return model.get(attrName)
			}).reduce(function(a, b) {
				return a + b;
			})
		} else {
			return 0
		}
	},
	
	nutrientTotals: function(mealName) {
		var cals = this.calculateTotals(mealName, "calories");
		var carbs = this.calculateTotals(mealName, "carbs");
		var fat = this.calculateTotals(mealName, "total_fat");
		var protein = this.calculateTotals(mealName, "protein");
		var sodium = this.calculateTotals(mealName, "sodium");
		var sugar = this.calculateTotals(mealName, "sugar");
		return [cals, carbs, fat, protein, sodium, sugar]
	},
	
	dailyNutrientTotals: function() {
		var cals = (this.nutrientTotals(this.model.breakfasts())[0] +
								this.nutrientTotals(this.model.lunches())[0] +
								this.nutrientTotals(this.model.dinners())[0] +
								this.nutrientTotals(this.model.snacks())[0]);

		var carbs = (this.nutrientTotals(this.model.breakfasts())[1] +
								this.nutrientTotals(this.model.lunches())[1] +
								this.nutrientTotals(this.model.dinners())[1] +
								this.nutrientTotals(this.model.snacks())[1]);

		var fat = (this.nutrientTotals(this.model.breakfasts())[2] +
								this.nutrientTotals(this.model.lunches())[2] +
								this.nutrientTotals(this.model.dinners())[2] +
								this.nutrientTotals(this.model.snacks())[2]);

		var protein = (this.nutrientTotals(this.model.breakfasts())[3] +
								this.nutrientTotals(this.model.lunches())[3] +
								this.nutrientTotals(this.model.dinners())[3] +
								this.nutrientTotals(this.model.snacks())[3]);

		var sodium = (this.nutrientTotals(this.model.breakfasts())[4] +
								this.nutrientTotals(this.model.lunches())[4] +
								this.nutrientTotals(this.model.dinners())[4] +
								this.nutrientTotals(this.model.snacks())[4]);

		var sugar = (this.nutrientTotals(this.model.breakfasts())[5] +
								this.nutrientTotals(this.model.lunches())[5] +
								this.nutrientTotals(this.model.dinners())[5] +
								this.nutrientTotals(this.model.snacks())[5]);
		return [cals, carbs, fat, protein, sodium, sugar]
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