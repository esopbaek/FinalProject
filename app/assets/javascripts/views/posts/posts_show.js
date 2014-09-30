window.App.Views.PostsShow = Backbone.CompositeView.extend({
  className: 'post-block group',
  initialize: function(options) {
		this.user = options.user;
		this.currentUser = options.currentUser;
    _.bindAll(this, "renderDetails");
    this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.comments(), "sync add remove", this.render);
		this.listenTo(App.Collections.users, "sync", this.render)
    this.model.on("add change", this.renderDetails);
  },
	events: {
		"click div.delete-post": "deletePost"
	},
	
  render: function() {
    this.renderDetails();
    this.renderCommentForm();
    return this;
  },
  renderDetails: function() {
    var that = this;
    var renderedContent = JST['posts/details']({ 
			currentUser: this.currentUser,
			user: this.user,
			post: this.model, 
			poster: App.Collections.users.get(this.model.get("poster_id"))
		});
    this.$el.html(renderedContent);
    this.model.comments().each(function(comment) {
      var commentsShow = new App.Views.CommentsShow({
				user: that.user,
				currentUser: that.currentUser,
        model: comment
      })
      commentsContainer = that.$(".post-info")
      that.appendChildTo(commentsShow, commentsContainer)
    })
  },
  renderCommentForm: function() {
    var commentForm = new App.Views.CommentsNew({ 
			model: this.model,
			user: this.user,
			currentUser: this.currentUser
		 });
    var commentFormContainer = this.$('.post-info');
    this.appendChildTo(commentForm, commentFormContainer);
  },
	
	deletePost: function(event) {
		event.preventDefault();
		this.model.destroy()
	}
});