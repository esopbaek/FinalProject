App.Views.MeasurementsNew = Backbone.View.extend({
	template: JST["measurements/new"],
	initialize: function() {
		this.listenTo(this.collection, "add destroy", this.render)
	},
	events: {
		"submit form.add-measurement": "submit",
		"click button": "deleteMeasurement"
	},
	render: function() {
		this.$el.html(this.template({
			measurements: this.collection
		}));
		return this;
	},
	submit: function(event) {
		var that = this;
		
		event.preventDefault();
		var params = $(event.currentTarget).serializeJSON()["measurement"];
		var newMeasurement = new App.Models.Measurement();
		newMeasurement.set(params);
		newMeasurement.save([], {
			success: function() {
				that.collection.add(newMeasurement)
			}
		});
		console.log(params)
		console.log(newMeasurement)
	},
	
	deleteMeasurement: function(event) {
		event.preventDefault();
		var measurementId = $(event.currentTarget).data('measurement_id');
		var measurement = this.collection.get(measurementId);
		measurement.destroy();
	}
})