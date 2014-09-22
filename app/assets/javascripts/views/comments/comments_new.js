window.App.Views.CommentsNew = Backbone.CompositeView.extend({
  className: "comment-form",
  events: {
    "submit form.new-comment": "createComment"
  },
	
  render: function() {
    this.$el.html(JST['comments/new']({
    	post: this.model
    }));
  },
	
  createComment: function(event) {
		var that = this;
		
		event.preventDefault();
		var params = $(event.currentTarget).serializeJSON()["comment"];
    this.model.comments().create({"comment": params}, {wait: true})
  }
});