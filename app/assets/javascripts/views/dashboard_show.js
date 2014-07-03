window.App.Views.Dashboard = Backbone.View.extend({
  template: JST["dashboard/show"],
  initialize: function() {
    this.listenTo(this.model, "sync", this.render)
  },
  render: function() {
    var renderedContent = this.template({
      dashboard: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});