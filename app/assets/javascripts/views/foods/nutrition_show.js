App.Views.NutritionShow = Backbone.View.extend({
  template: JST["foods/show"],

  initialize: function(options) {
    this.model = options.model;
	this.meal = options.meal;
	this.pageId = options.pageId;
    this.listenTo(this.model, "sync", this.render)
  },
  
  events: {
	  "click button": "addToDiary"
  },

  render: function() {
    var renderedContent = this.template({
      food: this.model
    });
    this.$el.html(renderedContent);
    return this
  },
  
  addToDiary: function(event) {
	  event.preventDefault();
	  var foodId = this.model.id;
	  var meal = this.meal;
	  var pageId = this.pageId;
	  console.log(foodId + meal + pageId);
	  $.ajax({
          type: 'post',
          data: {
            food_id: foodId,
            meal: meal
          },
		  url: "/diary_pages/" + pageId + "/food_entries",
          dataType: 'json',
          success: function(page) {
			window.location.href = "/diary_pages/" + page.id;
          }
	  });
  }
});