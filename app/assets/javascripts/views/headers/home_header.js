window.App.Views.MyHomeHeader = Backbone.View.extend({
		template: JST["navbar/myhome_header"],
		render: function() {
	    var renderedContent = this.template();
	    this.$el.html(renderedContent);
	    return this;
		}
})