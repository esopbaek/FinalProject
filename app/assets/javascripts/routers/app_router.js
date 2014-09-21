window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "foods": "foodsIndex",
    "": "dashboardShow",
    "foods/diary": "foodDiaryShow",
    "goals": "goalsShow",
    "goals/edit": "goalsEdit",
		"checkin": "checkIn"
  },
	
  foodsIndex: function() {
    var indexView = new App.Views.FoodsIndex({
      collection: App.Collections.foods
    });
    // if (this.currentView) {
    //   this.currentView.remove();
    // }
    //   this.currentView = indexView;
    // $("body").html(indexView.render(indexView.collection).$el);
    this._swapView(indexView)

  },

  dashboardShow: function() {
    App.Models.dashboard.fetch();
    App.Collections.posts.fetch();
    var dashboardView = new App.Views.Dashboard();
    this._swapView(dashboardView);
  },

  goalsShow: function() {
    var profile = new App.Models.GoalProfile();
    profile.fetch();
    var goalsView = new App.Views.GoalsShow({
      model: profile
    });
    this._swapView(goalsView);
  },

  goalsEdit: function() {
    var profile = new App.Models.DietProfile();
    profile.fetch();
    var goalsEditView = new App.Views.GoalsEdit({
      model: profile
    });
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

  // foodDiaryShow: function() {
  // 	  var diaryShow = new App.Models.
  // },

  _swapView: function (newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
      this.currentView = newView;
    $("body").html(newView.render().$el);
  }
});