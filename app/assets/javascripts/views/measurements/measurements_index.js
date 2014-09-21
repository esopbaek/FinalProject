window.App.Views.MeasurementsIndex = Backbone.View.extend({
  template: JST["measurements/checkin"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "submit form": "submit",
  },

  render: function() {
    var renderedContent = this.template({ measurements: this.model });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON()["measurement"];
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