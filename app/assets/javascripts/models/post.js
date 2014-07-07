window.App.Models.Post = Backbone.Model.extend({
  urlRoot: "/api/posts",
  comments: function () {
    this._comments = this._comments ||
        new App.Collections.Comments([], { post: this });
    return this._comments;
  },
  
  parse: function (jsonResp) {
    this.user;
    if (jsonResp.comments) {
      this.comments().set(jsonResp.comments);
      delete jsonResp.comments;
    }
    return jsonResp;
  },
})