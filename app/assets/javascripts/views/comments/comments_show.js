window.App.Views.CommentsShow = Backbone.CompositeView.extend({
  tagName: 'div',
  className: "comment-block group",
	events: {
		"submit form.delete-comment": "deleteComment"
	},
  render: function() {
    var commentMarkup = JST['comments/details']({ comment: this.model });
    this.$el.append(commentMarkup);
  },
	deleteComment: function(event) {
		event.preventDefault();
		this.model.destroy()
	}
	

});