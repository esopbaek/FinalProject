window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
		"": "dashboardShow",
    "foods": "foodsIndex",
    "foods/diary/:id": "foodDiaryShow",
    "goals": "goalsShow",
    "goals/edit": "goalsEdit",
		"checkin": "checkIn"
  },
	
  foodsIndex: function() {
    var indexView = new App.Views.FoodsIndex({
      collection: App.Collections.foods
    });
		var foodHeaderView = new App.Views.FoodHeader();
		this._swapHeaderView(foodHeaderView);
    this._swapView(indexView)

  },

  dashboardShow: function() {
    App.Models.dashboard.fetch();
    App.Collections.posts.fetch();
		var homeHeaderView = new App.Views.MyHomeHeader();
    var dashboardView = new App.Views.Dashboard();
		this._swapHeaderView(homeHeaderView);
    this._swapView(dashboardView);
  },

  goalsShow: function() {
    var profile = new App.Models.GoalProfile();
    profile.fetch();
    var goalsView = new App.Views.GoalsShow({
      model: profile
    });
		var homeHeaderView = new App.Views.MyHomeHeader();
		this._swapHeaderView(homeHeaderView);
    this._swapView(goalsView);
  },

  goalsEdit: function() {
    var profile = new App.Models.DietProfile();
    profile.fetch();
    var goalsEditView = new App.Views.GoalsEdit({
      model: profile
    });
		var homeHeaderView = new App.Views.MyHomeHeader();
		this._swapHeaderView(homeHeaderView);
    this._swapView(goalsEditView);
  },
  
  checkIn: function() {
	  var measurement = new App.Models.Measurement();
	  measurement.fetch();
	  var checkinView = new App.Views.MeasurementsIndex({
	  	model: measurement
	  });
	  this._swapView(checkinView)
  },

  foodDiaryShow: function(id) {
		var page = App.Collections.foodDiaryPages.getOrFetch(id);
		page.fetch({wait: true});
		
  	var diaryShow = new App.Views.FoodDiaryShow({
  		model: page
  	});
		
		var foodHeaderView = new App.Views.FoodHeader();
		this._swapHeaderView(foodHeaderView);
   	this._swapView(diaryShow);
  },
	
  _swapHeaderView: function (newHeaderView) {
    if (this.currentHeaderView) {
      this.currentHeaderView.remove();
    }
      this.currentHeaderView = newHeaderView;
    $("div.specific-headers").html(newHeaderView.render().$el);
  },
	
  _swapView: function (newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
      this.currentView = newView;
    $("div.main").html(newView.render().$el);
  }
});