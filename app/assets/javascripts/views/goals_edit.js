window.App.Views.GoalsEdit = Backbone.View.extend({
  template: JST["diet_profiles/edit"],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render)
  },

  events: {
    "submit form": "submit"
  },

  render: function() {
    var renderedContent = this.template({
      profile: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var profile = this.model;
    profile.set(params["profile"]);
    profile.save([], {
      success: function() {
        Backbone.history.navigate("/", { trigger: true });
      },
	  error: function() {
		  alert("FEAFEs")
	  }
    })
  }
})