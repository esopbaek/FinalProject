window.App.Views.PostsNew = Backbone.CompositeView.extend({
	className: "feed-form",
	initialize: function(options) {
		this.user = options.user;
		this.currentUser = options.currentUser;
	},
  events: {
    "submit form.new-post": "createPost"
  },
  render: function() {
    this.$el.html(JST['posts/new']({
			currentUser: this.currentUser,
			user: this.user
    }));
  },
  createPost: function(event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON()["post"];
    var newPost = new App.Models.Post({"post": params});
		var that = this;
    newPost.save({}, {
    	success: function() {
    			App.Collections.posts.add(newPost);
					that.render();
    	},
			error: function() {
				console.log("didn't save")
			}
    });
  }
});