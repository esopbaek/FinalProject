window.App.Views.DailySummaryView = Backbone.CompositeView.extend({
  template: JST["dashboard/daily_summary"],
  className: 'daily-summary group',
  initialize: function() {
    this.listenTo(this.model, "sync", this.render)
  },
  render: function() {
    var renderedContent = this.template({
      dashboard: this.model
    })
    this.$el.html(renderedContent)
    return this;
  }
})

window.App.Views.NewsFeedView = Backbone.CompositeView.extend({
  className: 'news-feed',
  render: function(){
    this.renderLayout();
    this.renderForm();
    this.renderList();
    return this
  },

  renderLayout: function() {
    this.$el.html(JST["dashboard/news_feed"]());
  },

  renderForm: function() {
    var postsNew = new App.Views.PostsNew();
    var feedHeader = this.$(".feed-header")
    this.insertChildAfter(postsNew, feedHeader)
  },

  renderList: function() {
    var postsList = new window.App.Views.PostsIndex({
      collection: App.Collections.posts
    })
    var postsContainer = this.$(".feed-posts");
    this.renderChildInto(postsList, postsContainer)
  }
})

window.App.Views.PostsNew = Backbone.CompositeView.extend({
  className: "feed-form",
  events: {
    "submit form": "createPost"
  },
  render: function() {
    this.$el.html(JST['posts/new']);
  },
  createPost: function(event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newPost = new App.Models.Post(params["post"]);

    newPost.save({}, {
      success: function () {
        App.Collections.posts.add(newPost)
      }
    });
  }
});

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

window.App.Views.PostsShow = Backbone.CompositeView.extend({
  tagName: 'li',
  initialize: function() {
    _.bindAll(this, "renderDetails");
    this.listenTo(this.model, "sync", this.render)
    // this.model.on("change", this.renderDetails);
  },
  render: function() {
    this.renderLayout();
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
    this.$('.post-details').html(renderedContent);

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