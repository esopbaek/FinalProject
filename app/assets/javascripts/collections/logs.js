window.App.Collections.Logs = Backbone.Collection.extend({
  model: App.Models.Log,

  url: function () {
    return this.measurement.url() + "/logs";
  },

  initialize: function (models, options) {
    this.measurement = options.measurement;
  }
})