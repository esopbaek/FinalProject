window.App.Views.MeasurementsIndex = Backbone.View.extend({
  template: JST["measurements/checkin"],

  initialize: function(options) {
		var that = this;
    this.listenTo(this.collection, "sync add change", this.render);
		_.each(this.collection.models, function(measurement) {
			that.listenTo(measurement.logs(), "sync add change", that.render)
		})
  },

  events: {
    "submit form.log-measurement": "submit",
  },

  render: function() {
		var weightMeasurement = this.collection.findWhere({name: "weight"});
		var weightLogs = weightMeasurement.logs();
		var latestWeightLog = weightLogs.models[weightLogs.length - 1];
		
    var renderedContent = this.template({ 
			measurements: this.collection,
			latestWeightLog: latestWeightLog,
		});
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
		var that = this;
		event.preventDefault();
		var params = $(event.currentTarget).serializeJSON()["log"];
		var measurementId = $(event.currentTarget).children("input").val()
		var measurement = this.collection.get(measurementId)
		measurement.logs().create(params)
  }

});