window.App.Collections.FoodDiaryPages = Backbone.Collection.extend({
  url: "api/diary_pages",
	model: App.Models.FoodDiaryPage,
  getOrFetch: function(id) {
    var diaryPage;
    var diaryPages = this;
    if (diaryPage = this.get(id)) {
      diaryPage.fetch();
    } else {
      diaryPage = new App.Models.FoodDiaryPage({id: id});
      diaryPage.fetch({
        success: function () { diaryPages.add(diaryPage); }
      });
    }
    return diaryPage;
  },
})

App.Collections.foodDiaryPages = new window.App.Collections.FoodDiaryPages();