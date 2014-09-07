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

  render: function() {
    var renderedContent = this.template({ foods: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON()["query"];
    App.Collections.foods.fetch({data: {query: encodeURI(params)}});
    this.render();
  },

  showNutrition: function (event) {
    event.preventDefault;
    var params = $(event.currentTarget);
    var model = App.Collections.foods.findWhere({item_id: params.data("food_id")});

    var showView = new App.Views.FoodsShow({
      model: model
    });
    $("div.nutrition-label").html(showView.render().$el);
  }
});