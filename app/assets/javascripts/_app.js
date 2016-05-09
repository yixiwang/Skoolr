var app = angular.module('skoolr', []);

function generateMap(address) {
	var geocoder = new google.maps.Geocoder();
	var location;
	geocoder.geocode({'address': address}, function(results, status) {
		location = results[0].geometry.location;
		var mapProp = {
			center: location,
			zoom: 16
		};
		var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
		var marker = new google.maps.Marker({
			map: map,
			position: location
		});
		map.setCenter(location);
	});
}

function generateMapWithPath(address0) {
	var address1 = getParameterByName('search');
	var geocoder0 = new google.maps.Geocoder();
	var geocoder1 = new google.maps.Geocoder();
	var location0, location1;
	geocoder0.geocode({'address': address0}, function(results, status) {
		location0 = results[0].geometry.location;
		geocoder1.geocode({'address': address1}, function(results, status) {
			location1 = results[0].geometry.location;
			var bounds = new google.maps.LatLngBounds();
			var map = new google.maps.Map(document.getElementById("googleMap"));
			var marker0 = new google.maps.Marker({
				map: map,
				position: location0
			});
			var marker1 = new google.maps.Marker({
				map: map,
				position: location1,
				icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
			});
			bounds.extend(marker0.position);
			bounds.extend(marker1.position);
			map.fitBounds(bounds);
		});
	});
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}