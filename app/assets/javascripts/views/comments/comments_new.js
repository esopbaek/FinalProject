window.App.Views.CommentsNew = Backbone.CompositeView.extend({
  className: "comment-form",
  events: {
    "submit form.new-comment": "createComment"
  },
	
	initialize: function(options) {
		this.user = options.user;
		this.currentUser = options.currentUser;
	},
	
  render: function() {
    this.$el.html(JST['comments/new']({
			user: this.user,
			currentUser: this.currentUser,
    	post: this.model
    }));
  },
	
  createComment: function(event) {
		event.preventDefault();
		var params = $(event.currentTarget).serializeJSON()["comment"];
    this.model.comments().create({"comment": params}, {wait: true})
  }
});