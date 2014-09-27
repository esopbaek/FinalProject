App.Views.MeasurementsLogView = Backbone.View.extend({
	template: JST["measurements/logs"],
	initialize: function() {
		var that = this;
		this.chosenMeasurement = this.collection.findWhere({name: "weight"});
		_.each(this.collection.models, function(measurement) {
			that.listenTo(measurement.logs(), "sync add remove", that.render)
		});
	},
	events: {
		"submit form.see-logs": "showLogs",
		"click button.delete-log": "deleteLog",
		"submit form.add-custom-log": "addCustomLog"
	},
	render: function() {
		var renderedContent = this.template({
			measurements: this.collection,
			chosenMeasurement: this.chosenMeasurement
		});
		this.$el.html(renderedContent)
		return this;
	},
	showLogs: function(event) {
		event.preventDefault();
		var measurementId = $(event.currentTarget).serializeJSON()["measurement"].id;
		this.chosenMeasurement = this.collection.get(measurementId);
		this.render();
	},
	deleteLog: function(event) {
		event.preventDefault();
		var logId = $(event.currentTarget).data("log_id");
		var log = this.chosenMeasurement.logs().get(logId);
		log.destroy({url: "/api/logs/" + logId});
	},
	
	addCustomLog: function(event) {
		var that = this;
		event.preventDefault();
		var params = $(event.currentTarget).serializeJSON()["log"];
		var newLog = new App.Models.Log(params);
		this.chosenMeasurement.logs().create(params);
	}
})