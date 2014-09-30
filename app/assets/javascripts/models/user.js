App.Models.User = Backbone.Model.extend({
	urlRoot: "/api/users",
  socialProfile: function () {
    this._social_profile = this._social_profile ||
        new App.Models.SocialProfile([], { user: this });
    return this._social_profile;
  },
  
  parse: function (jsonResp) {
    if (jsonResp.social_profile) {
      this.socialProfile().set(jsonResp.social_profile);
      delete jsonResp.social_profile;
    }
    return jsonResp;
  },
})
