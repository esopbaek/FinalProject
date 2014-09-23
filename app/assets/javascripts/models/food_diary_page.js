window.App.Models.FoodDiaryPage = Backbone.Model.extend({
	urlRoot: "api/diary_pages",
	
  breakfasts: function () {
    this._breakfasts = this._breakfasts ||
        new App.Collections.Breakfasts([], { page: this });
    return this._breakfasts;
  },
	
  lunches: function () {
    this._lunches = this._lunches ||
        new App.Collections.Lunches([], { page: this });
    return this._lunches;
  },
	
  dinners: function () {
    this._dinners = this._dinners ||
        new App.Collections.Dinners([], { page: this });
    return this._dinners;
  },
	
  snacks: function () {
    this._snacks = this._snacks ||
        new App.Collections.Snacks([], { page: this });
    return this._snacks;
  },
})