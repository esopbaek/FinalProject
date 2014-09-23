window.App.Collections.Snacks = Backbone.Collection.extend({
	model: App.Models.Snack,
  url: function () {
    return this.page.url() + "/snacks";
  },

  initialize: function (models, options) {
		if (options) {
    this.page = options.page;
		}
  }
})

App.Collections.snacks = new App.Collections.Snacks();