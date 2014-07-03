window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "foods": "foodsIndex",
    "dashboard": "dashboardShow",
  },
  
  dashboardShow: function() {
    var dashboard = new App.Models.Dashboard();
    dashboard.fetch();
    var showView = new App.Views.Dashboard({
      model: dashboard
    }); 
    
    this._swapView(showView);
  },

  foodsIndex: function() {
    App.Collections.foods.fetch();

    var indexView = new App.Views.FoodsIndex({
      collection: App.Collections.foods
    });
    if (this.currentView) {
      this.currentView.remove();
    }
      this.currentView = indexView;
    $("body").html(indexView.render(indexView.collection).$el);

  },


  _swapView: function (newView) {
    if (this.currentView) {
      this.currentView.remove();
    }
      this.currentView = newView;
    $("body").html(newView.render().$el);
  }
});