window.App.Collections.Dinners = Backbone.Collection.extend({
	model: App.Models.Dinner,
  url: function () {
    return this.page.url() + "/dinners";
  },

  initialize: function (models, options) {
		if (options) {
    this.page = options.page;
		}
  }
})

App.Collections.dinners = new App.Collections.Dinners();