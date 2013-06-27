angular.module("todo.app", []).controller('MainCtrl', function($scope) {
	$scope.currentPlayingRecord = undefined;
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