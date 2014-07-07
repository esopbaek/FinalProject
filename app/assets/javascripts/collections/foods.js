window.App.Collections.Foods = Backbone.Collection.extend({
  // url: "/api/foods/database",
  url: "api/foods",
  model: App.Models.Food,
  getOrFetch: function(id) {
    var food;
    var foods = this;
    if (food = this.get(id)) {
      food.fetch();
    } else {
      food = new App.Models.Food({id: id});
      food.fetch({
        success: function () { foods.add(food); }
      });
    }
    return food;
  }
});

App.Collections.foods = new App.Collections.Foods();