window.App.Views.GoalsShow = Backbone.View.extend({
  template: JST["diet_profiles/goals"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({dietProfile: this.model});
    this.$el.html(renderedContent);
    return this;
  }
});