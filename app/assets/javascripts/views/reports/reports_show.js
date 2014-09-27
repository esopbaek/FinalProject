App.Views.ReportsShow = Backbone.View.extend({
	template: JST["reports/reportsShow"],
	events: {
		"click button": "showChart"
	},
	render: function() {
		var renderedContent = this.template({
			measurements: this.collection
		});
		this.$el.html(renderedContent);
		return this;
	},
	
	showChart: function(event) {
		event.preventDefault();
		var measurement_id = $("select").val()
		this.chosenReport = this.collection.get(measurement_id);
		this.reportName = this.chosenReport.get("name").charAt(0).toUpperCase() + this.chosenReport.get("name").slice(1);
		var dataLength = $(event.currentTarget).data("data_length");
		var reportLogs = this.chosenReport.logs().models;
		var logDates = _.map(reportLogs, function(log) {
			 return log.get("created_at")
		});
		
		var loggedData = _.map(reportLogs, function(log) {
			 return log.get("amount")
		});

		this.$("div.highchart").highcharts({
	      title: {
	          text: this.reportName,
	      },
	      xAxis: {
	          categories: logDates.slice(0-dataLength),
						title: {
							text: "Log Dates"
						}
	      },
	      yAxis: {
	          title: {
	              text: this.reportName + " (" + this.chosenReport.get("unit") + ")"
	          },
	      },
	      tooltip: {
	          valueSuffix: this.chosenReport.get("unit")
	      },
				series: [{
					showInLegend: false,
					name: this.reportName,
					data: loggedData.slice(0-dataLength)
				}]
	  });
	}

})