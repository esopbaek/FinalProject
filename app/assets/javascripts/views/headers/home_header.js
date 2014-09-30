window.App.Views.MyHomeHeader = Backbone.View.extend({
		template: JST["navbar/myhome_header"],
		initialize: function(options) {
		},
		render: function() {
			var dashboard = App.Models.dashboard;
	    var renderedContent = this.template({
				dashboard: dashboard,
	    });
	    this.$el.html(renderedContent);
	    return this;
		}
})