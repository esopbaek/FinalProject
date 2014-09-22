window.App.Views.CommentsShow = Backbone.CompositeView.extend({
  tagName: 'div',
  className: "comment-block group",
  render: function() {
    var that = this;
    var commentMarkup = JST['comments/details']({ comment: that.model });
    that.$el.append(commentMarkup);
  },

});