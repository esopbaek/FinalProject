window.App.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "foods/database": "foodsIndex",
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