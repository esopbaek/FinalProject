window.App.Views.DailySummaryView = Backbone.CompositeView.extend({
  template: JST["dashboard/daily_summary"],
  className: 'daily-summary group',
  initialize: function() {
    this.listenTo(this.model, "sync", this.render)
  },
  render: function() {
    var renderedContent = this.template({
      dashboard: this.model
    })
    this.$el.html(renderedContent)
    return this;
  }
})