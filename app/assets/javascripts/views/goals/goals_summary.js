window.App.Views.GoalsSummary = Backbone.View.extend({
  template: JST["diet_profiles/goals_summary"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render)
  },

  events: {
    "click button.goals-summary": "directToHomePage"
  },

  render: function() {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  directToHomePage: function() {
  	Backbone.history.navigate("", {trigger: true})
  }
})