window.App.Views.CommentsShow = Backbone.CompositeView.extend({
  tagName: 'div',
  className: "comment-block group",
	initialize: function(options) {
		this.user = options.user,
		this.currentUser = options.currentUser,
		this.commenter = App.Collections.users.get(this.model.get("commenter_id"));
	},
	events: {
		"submit form.delete-comment": "deleteComment"
	},
  render: function() {
    var commentMarkup = JST['comments/details']({ 
			user: this.user,
			currentUser: this.currentUser,
			comment: this.model,
			commenter: this.commenter 
		});
    this.$el.append(commentMarkup);
  },
	deleteComment: function(event) {
		event.preventDefault();
		this.model.destroy()
	}
	

});