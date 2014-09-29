window.App.Views.DailySummaryView = Backbone.CompositeView.extend({
  template: JST["dashboard/daily_summary"],
  className: 'summary-box group',
  initialize: function(options) {
		this.currentUser = options.currentUser;
		this.currentUser.fetch();
    this.listenTo(this.model, "sync", this.render)
  },
  render: function() {
    var renderedContent = this.template({
			currentUser: this.currentUser,
      dashboard: this.model
    })
    this.$el.html(renderedContent)
    return this;
  },
	events: {
	  'change .my-photo-upload': 'handleFile',
	},
	handleFile: function (event) {
	  var file = event.currentTarget.files[0];
	  var view = this;
	  var reader = new FileReader();
	  reader.onload = function(e) {
	    // note that this isn't saving
	    view.currentUser.set('profile_photo', this.result);
			view.currentUser.save()
	  }
	  reader.readAsDataURL(file);
		this.$(".image-holder").html(view.currentUser.get("profile_photo"))
	}
})