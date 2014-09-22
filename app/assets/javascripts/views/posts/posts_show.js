window.App.Views.PostsShow = Backbone.CompositeView.extend({
  className: 'post-block group',
  initialize: function() {
    _.bindAll(this, "renderDetails");
    this.listenTo(this.model, "sync", this.render)
		this.listenTo(this.model.comments(), "sync add", this.render)
    this.model.on("add change", this.renderDetails);
  },
  render: function() {
    // this.renderLayout();
    this.renderDetails();
    this.renderCommentForm();
    return this;
  },
  renderLayout: function() {
    this.$el.html(JST['posts/show']());
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
  }
});