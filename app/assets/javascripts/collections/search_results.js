App.Collections.SearchResults = Backbone.Collection.extend({
	url: "api/foods/search"
})

App.Collections.searchResults = new App.Collections.SearchResults();