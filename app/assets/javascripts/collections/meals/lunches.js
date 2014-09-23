window.App.Collections.Lunches = Backbone.Collection.extend({
	model: App.Models.Lunch,
  url: function () {
    return this.page.url() + "/lunches";
  },
  initialize: function (models, options) {
		if (options) {
    this.page = options.page;
		}
  }
})

App.Collections.lunches = new App.Collections.Lunches();