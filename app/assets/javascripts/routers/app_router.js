window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "foods": "foodsIndex",
    "dashboard": "dashboardShow",
    "foods/diary": "foodDiaryShow",
    "goals": "goalsShow",
    "goals/edit": "goalsEdit"
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
    var profile = new App.Models.DietProfile();
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

  foodDiaryShow: function() {

  },

  _swapView: function (newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
      this.currentView = newView;
    $("body").html(newView.render().$el);
  }
});