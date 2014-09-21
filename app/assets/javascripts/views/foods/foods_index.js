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
    var weight = new App.Models.Log(params["log"])
    this.render();
  }
});