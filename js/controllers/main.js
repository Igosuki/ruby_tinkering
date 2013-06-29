angular.module("todo.app", []).controller('MainCtrl', function($scope) {
	$scope.currentPlayingRecord = {previewUrl: ""};
	$scope.play = function(record) {
		console.log("Playing " + angular.toJson(record));
		$scope.playing = true;
		$scope.currentPlayingRecord = record;
	};
	$scope.pause = function(scope) {
		console.log("Pausing");
		$scope.playing = false;
	};
});
//nganimate / skew, scale, rorate w/ sliders

//nganimate -webkit-animation-[name, duration, iteration-count, timing-function, direction]

//new selectors (startswith, contains etc)

//rotate3d

//redraw video on canvas with filter

