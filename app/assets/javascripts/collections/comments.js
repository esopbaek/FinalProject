window.App.Collections.Comments = Backbone.Collection.extend({
  model: App.Models.Comment,

  url: function () {
    return this.post.url() + "/comments";
  },

  initialize: function (models, options) {
    this.post = options.post;
  }
})