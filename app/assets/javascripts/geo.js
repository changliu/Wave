(function(){
	if (navigator.geolocation) {
		alert("hello");
		navigator.geolocation.getCurrentPosition(success, error);
	} else {
		error('not supported');
	}

	function success(position) {
		console.log("The user's position is at");
		debug = position;
		console.log(debug);
		
		// make api call to foursquare and then display information here. don't need ruby at all.
	}
});