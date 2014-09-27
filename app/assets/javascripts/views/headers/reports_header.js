window.App.Views.ReportsHeader = Backbone.View.extend({		
	template: JST["navbar/reports_header"],		
	render: function() {	    
		var renderedContent = this.template();	    
		this.$el.html(renderedContent);	    
		return this;		
	}
})