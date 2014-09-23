window.App.Collections.Measurements = Backbone.Collection.extend({
  url: "api/measurements",
  model: App.Models.Measurement,
  getOrFetch: function(id) {
    var measurement;
    var measurements = this;
    if (measurement = this.get(id)) {
      measurement.fetch();
    } else {
      measurement = new App.Models.Measurements({id: id});
      measurement.fetch({
        success: function () { measurements.add(measurement); }
      });
    }
    return measurement;
  },

});

App.Collections.measurements = new App.Collections.Measurements();
  