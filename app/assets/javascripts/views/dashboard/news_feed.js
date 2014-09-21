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