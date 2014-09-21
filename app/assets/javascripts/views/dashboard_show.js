window.App.Views.Dashboard = Backbone.CompositeView.extend({
  className: "all-content",
  
  render: function() {
		this.renderLayout();
    this.renderSummary();
    this.renderFeed();
    return this
  },
  renderLayout: function() {
    this.$el.html(JST["dashboard/show"])
  },
  renderSummary: function() {
    var model = App.Models.dashboard;
    var summaryView = new App.Views.DailySummaryView({
      model: model
    });
    this.appendChildTo(summaryView, this.$el)
  },
  renderFeed: function() {
    var feedView = new App.Views.NewsFeedView();
    this.appendChildTo(feedView, this.$el)
  }
});
