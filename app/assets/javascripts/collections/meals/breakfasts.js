window.App.Collections.Breakfasts = Backbone.Collection.extend({
	model: App.Models.Breakfast,
  url: function () {
    return this.page.url() + "/breakfasts";
  },

  initialize: function (models, options) {
		if (options) {
    	this.page = options.page;
		}	
  }
})

App.Collections.breakfasts = new App.Collections.Breakfasts();