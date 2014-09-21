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