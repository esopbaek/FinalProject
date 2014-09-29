window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
		"": "dashboardShow",
    "diary/:id": "foodDiaryShow",
    "foods/:meal/:id": "foodsIndex",
    "goals": "goalsShow",
    "goals/edit": "goalsEdit",
		"goals/summary": "goalsSummary",
		"checkin": "checkIn",
		"measurement/new": "measurementsNew",
		"measurement/logs": "measurementsEdit",
		"reports": "reports",
		"profile": "profile",
		"profile/edit": "profileEdit"
  },
	
  foodsIndex: function(meal, id) {
    var indexView = new App.Views.FoodsIndex({
      collection: App.Collections.foods,
			meal: meal,
			pageId: id
    });
		var foodHeaderView = new App.Views.FoodHeader();
		this._swapHeaderView(foodHeaderView);
    this._swapView(indexView)

  },

  dashboardShow: function() {
		var view = this;
    App.Models.dashboard.fetch();
    App.Collections.posts.fetch();
		App.Models.currentUser.fetch({
			success: function() {
				var homeHeaderView = new App.Views.MyHomeHeader();
		    var dashboardView = new App.Views.Dashboard();
				view._swapHeaderView(homeHeaderView);
		    view._swapView(dashboardView);
			}
		});

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
	
	goalsSummary:function() {
		var profile = new App.Models.GoalSummaryProfile();
    profile.fetch();
		
    var goalsSummaryView = new App.Views.GoalsSummary({
      model: profile
    });
		var homeHeaderView = new App.Views.MyHomeHeader();
		this._swapHeaderView(homeHeaderView);
    this._swapView(goalsSummaryView);
		
	},
	 
  checkIn: function() {
		var that = this;
	  var measurements = new App.Collections.Measurements();
	  measurements.fetch({
	  	success: function(collection) {
			  var checkinView = new App.Views.MeasurementsIndex({
			  	collection: collection
			  });
				var homeHeaderView = new App.Views.MyHomeHeader();
				that._swapHeaderView(homeHeaderView);
			  that._swapView(checkinView)
	  	}
	  });
  },
	
	measurementsNew: function() {
		var that = this;
		App.Collections.measurements.fetch({
			success: function(collection) {
				var newMeasurementView = new App.Views.MeasurementsNew({
					collection: collection
				});
				var homeHeaderView = new App.Views.MyHomeHeader();
				that._swapHeaderView(homeHeaderView);
		    that._swapView(newMeasurementView);
			}
		})
	},
	
	measurementsEdit: function() {
		var that = this;
		App.Collections.measurements.fetch({
			success: function(collection) {
				var measurementLogsView = new App.Views.MeasurementsLogView({
					collection: collection
				});
				var homeHeaderView = new App.Views.MyHomeHeader();
				that._swapHeaderView(homeHeaderView);
		    that._swapView(measurementLogsView);
			}
		})
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
	
	reports: function() {
		var that = this;
		App.Models.dashboard.fetch();
		App.Collections.measurements.fetch({
			success: function(collection) {
				var reportsShow = new App.Views.ReportsShow({
					collection: collection
				})
				var reportsHeaderView = new App.Views.ReportsHeader();
				that._swapHeaderView(reportsHeaderView);
		    that._swapView(reportsShow);
			}
		})
	},
	
	profile: function() {
		var that = this;
		var profile = new App.Models.SocialProfile();
		profile.fetch({
			success: function(model){
				var profileShow = new App.Views.SocialProfileShow({
					model: model
				})
				var homeHeaderView = new App.Views.MyHomeHeader();
				that._swapHeaderView(homeHeaderView);
		    that._swapView(profileShow);
			}
		})
	},
	
	profileEdit: function() {
		var that = this;
		var profile = new App.Models.SocialProfile();
		profile.fetch({
			success: function(model){
				var profileEditView = new App.Views.SocialProfileEdit({
					model: model
				})
				var homeHeaderView = new App.Views.MyHomeHeader();
				that._swapHeaderView(homeHeaderView);
		    that._swapView(profileEditView);
			}
		})
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