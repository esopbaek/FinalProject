window.App.Views.FoodsIndex = Backbone.CompositeView.extend({
  template: JST["foods/index"],

  initialize: function(options) {
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render);
  },

  events: {
    "submit form": "submit",
    "click li.list": "showNutrition"
  },

  render: function(coll) {
    var renderedContent = this.template({ foods: coll });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var filteredcoll = new App.Collections.Foods();
    var filtered = _.where(this.collection.toJSON(), {name: params["query"]});
    filteredcoll.set(filtered)
    this.render(filteredcoll)
  },

  showNutrition: function (event) {
    event.preventDefault;
    var params = $(event.currentTarget);
    var model = App.Collections.foods.get(params.data("food_id"));
    var showView = new App.Views.FoodsShow({
      model: model
    });
    $("div.nutrition-label").html(showView.render().$el);
  }
});