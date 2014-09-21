window.App.Views.PostsIndex = Backbone.CompositeView.extend({
  tagName: 'ul',
  className: 'posts-list',
  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render)
  },

  render: function() {
    this.$el.empty();
    var that = this;
    this.collection.each(function (post) {
      var postsShow = new App.Views.PostsShow({ model: post })
      that.prependChildTo(postsShow, that.$el)
    });
    return this
  }
});




window.App.Views.CommentsShow = Backbone.CompositeView.extend({
  tagName: 'div',
  className: "comment-block group",
  render: function() {
    var that = this;
    var commentMarkup = JST['comments/details']({ comment: this.model });
    that.$el.append(commentMarkup);
  },

});

window.App.Views.CommentsNew = Backbone.CompositeView.extend({
  className: "comment-form",
  events: {
    "click button": "createComment"
  },
  render: function() {
    this.$el.html(JST['comments/new']);
  },
  createComment: function() {
    var comment = new Comment({ comment: $('.new-comment-input').val() });
    this.$('.new-comment-input').val('');
    this.model.comments().create(comment);
  }
});