App.Collections.Users = Backbone.Collection.extend({
	url: "api/users",
	model: App.Models.User,
  getOrFetch: function(id) {
    var user;
    var users = this;
    if (user = this.get(id)) {
      user.fetch();
    } else {
      user = new App.Models.User({id: id});
      user.fetch({
        success: function () { users.add(user); }
      });
    }
    return user;
  },
})

App.Collections.users = new App.Collections.Users();
