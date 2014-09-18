$(document).ready(function() {
	$("button#demo, button.shepherd").click(function() {
		$("input#user_username").val("esop1");
		$("input#user_password").val("password")
	})
	
	
	var tour;

	tour = new Shepherd.Tour({
	  defaults: {
	    classes: 'shepherd-theme-arrows',
	    scrollTo: true
	  }
	});
	
	$("button.shepherd").click(function() {
		tour.start()	
	})
	
	tour.addStep(1, {
	  text: 'Welcome to YourFitnessPal! Let me show you around. Go ahead and login below with the demo account',
	  buttons: [
	    {
	      text: 'Next',
	      action: function() {
			  $("form").submit();
	      }
	    }
	  ]
	  
	});

	tour.addStep(2, {
  	  text: 'Welcome'
	});
	


})
