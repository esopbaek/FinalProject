App.Views.FoodsShow = Backbone.View.extend({
  template: JST["foods/show"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render)
  },

  render: function() {
    var renderedContent = this.template({
      food: this.model
    });
    this.$el.html(renderedContent);
    return this
  }
});