window.App.Views.NutritionShow = Backbone.View.extend({
  template: JST["foods/show"],

  initialize: function(options) {
		this.meal = options.meal;
		this.pageId = options.pageId;
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
		this.render();
		var that = this;
	  event.preventDefault();
		App.Collections.foods.fetch({wait: true});
		var food = App.Collections.foods.where({name: this.model.get("name"), brand: this.model.get("brand")})[0]
		debugger
	  var foodId = food.id
	  var meal = this.meal;
	  var pageId = this.pageId;
	  $.ajax({
          type: 'post',
          data: {
						diary_page_id: that.pageId,
            food_id: foodId,
            meal: meal
          },
		  		url: "api/diary_pages/" + pageId + "/food_entries",
          dataType: 'json',
	  });
		Backbone.history.navigate("diary/" + pageId, {trigger: true});
  }
});