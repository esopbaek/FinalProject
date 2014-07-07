window.App.Models.Dashboard = Backbone.Model.extend({
  urlRoot: '/api/dashboard'
});

App.Models.dashboard = new App.Models.Dashboard();