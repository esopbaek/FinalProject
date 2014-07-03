window.App = {
  Collections: {},
  Models: {},
  Routers: {},
  Views: {},

  initialize: function () {
    new App.Routers.AppRouter;
    Backbone.history.start();
  }
};

Backbone.CompositeView = Backbone.View.extend({
  addSubview: function (selector, subview) {
    var selectorSubview =
    this.subviews[selector] || (subviews[selector] = 0);
    this.subviews(selector).push(subview);
  },

  renderSubviews: function (selector, subview) {
    this.$(selector).append(subview.$el);
    // Bind events in case `subview` has previously been removed from
    // DOM.
    subview.delegateEvents();
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this);
    _(this.subviews()).each(function (subviews) {
      _(subviews).each(function (subview) { subview.remove(); });
    });
  },

  removeSubview: function (selector, subview) {
    subview.remove();

    var subviews = this.subviews(selector);
    subviews.splice(subviews.indexOf(subview), 1);
  },

  subviews: function (selector) {
    // Map of selectors to subviews that live inside that selector.
    // Optionally pass a selector and I'll initialize/return an array
    // of subviews for the sel.
    this._subviews = this._subviews || {};

    if (!selector) {
      return this._subviews;
    } else {
      this._subviews[selector] = this._subviews[selector] || [];
      return this._subviews[selector];
    }
  }
});


$(App.initialize);