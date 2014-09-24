window.App.Views.PostsShow = Backbone.CompositeView.extend({
  className: 'post-block group',
  initialize: function() {
    _.bindAll(this, "renderDetails");
    this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.comments(), "sync add remove", this.render);
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
    var renderedContent = JST['posts/details']({ post: this.model });
    this.$el.html(renderedContent);
    this.model.comments().each(function(comment) {
      var commentsShow = new App.Views.CommentsShow({
        model: comment
      })
      commentsContainer = that.$(".post-info")
      that.appendChildTo(commentsShow, commentsContainer)
    })
  },
  renderCommentForm: function() {
    var commentForm = new App.Views.CommentsNew({ model: this.model });
    var commentFormContainer = this.$('.post-info');
    this.appendChildTo(commentForm, commentFormContainer);
  },
	
	deletePost: function(event) {
		event.preventDefault();
		this.model.destroy()
	}
});