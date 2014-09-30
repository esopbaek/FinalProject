window.App.Collections.Posts = Backbone.Collection.extend({
  url: "api/posts",
  model: App.Models.Post,
  getOrFetch: function(id) {
    var post;
    var posts = this;
    if (post = this.get(id)) {
      post.fetch();
    } else {
      post = new App.Models.Post();
      post.fetch({
        success: function () { posts.add(post); }
      });
    }
    return post;
  },

});

App.Collections.posts = new App.Collections.Posts();
  