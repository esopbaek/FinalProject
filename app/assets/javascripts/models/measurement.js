window.App.Models.Measurement = Backbone.Model.extend({
  urlRoot: "api/measurements",
	logs: function() {
		this._logs = this._logs || 
			new App.Collections.Logs([], {measurement: this})
		return this._logs
	},
  parse: function (jsonResp) {
    if (jsonResp.logs) {
      this.logs().set(jsonResp.logs);
      delete jsonResp.logs;
    }
    return jsonResp;
  },
});