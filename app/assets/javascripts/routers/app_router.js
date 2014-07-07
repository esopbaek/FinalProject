window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "foods": "foodsIndex",
    "dashboard": "dashboardShow",
    "foods/diary": "foodDiaryShow"
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