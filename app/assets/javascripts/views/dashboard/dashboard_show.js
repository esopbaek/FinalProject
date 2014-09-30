window.App.Views.Dashboard = Backbone.CompositeView.extend({
  className: "all-content group",
  render: function() {
    this.renderSummary();
    this.renderFeed();
    return this
  },
  renderSummary: function() {
  var model = App.Models.dashboard;
	App.Models.currentUser.fetch();
  var summaryView = new App.Views.DailySummaryView({
		currentUser: App.Models.currentUser,
    model: model
  });
  this.appendChildTo(summaryView, this.$el)
  },
  renderFeed: function() {
    var feedView = new App.Views.NewsFeedView({
			user: App.Models.currentUser,
    	currentUser: App.Models.currentUser,
    });
    this.appendChildTo(feedView, this.$el)
  }
});
