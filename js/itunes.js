var app = angular.module("Todo", ["ngResource","ngCookies", "ui.bootstrap"]);
app.config(function ($routeProvider, $httpProvider) {
$routeProvider
    .when('/itunes', {
        templateUrl: 'view.html'
    })
    .otherwise({
        redirectTo: '/'
    });
});
	
function ITunesCtrl($http, $resource, $cookieStore, $scope, $parse, $location) {
	$scope.searchTypes = [
		{label: "All", value: "all"},
		{label: "Movie", value: "movie"},
		{label: "Video", value: "musicVideo"},
		{label: "Music", value: "music"},
		{label: "Podcast", value: "podcast"},
		{label: "TV Show", value: "tvShow"}
	];
	$scope.searchType = "all";
	$scope.mediaTypes = [
		{label: "Media Type", value: "kind"},
		{label: "Media Item Name", value: "trackName"},
		{label: "Collection Name", value: "collectionName"},
		{label: "Artist", value: "artistName"}
	];
	$scope.sortCriteria = "artistName";
	$scope.searchQuery = "Bob Dylan";
    $scope.playing = false;

	var iTunesService = $resource("https://itunes.apple.com/search",
		{callback: 'JSON_CALLBACK'}, {get: {method: 'JSONP'}});
	$scope.searchRecords = function() { 
		iTunesService.get({
			term: $scope.searchQuery, 
			media: $scope.searchType
		}, function(result) {
			console.log(result.results[0]);
			$scope.records = result.results;
		});
	};
	$scope.cookie = function(record, $index) {
		record.rating = $cookieStore.get(record.trackId) || 0;
		$scope.$watch($parse($scope.records[$index].rating), function(oldValue, newValue) {
			//console.log(new Date() + " Old Value : " + oldValue + " New Value : " + newValue);
			$cookieStore.put(record.trackId, newValue);
		}, true);
	};
	$scope.play = function(record) {
		console.log("Playing " + angular.toJson(record));
		$scope.playing = true;
		$scope.currentPlayingRecord = record;
	};
	$scope.pause = function(scope) {
		console.log("Pausing");
		$scope.playing = false;
	};
}

app.directive('videoLoader', function(){
    return {
    	scope: {
    		src: '@',
    		playing: '@'
    	},
    	transclude: true,
    	controller: function($scope, $element, $attrs, $transclude) {
    		$scope.$watch("currentPlayingRecord",  function(newValue, oldValue){ 
    			console.log("Load and Play : (now)" + newValue + " (before)"+oldValue);
	            $element[0].load();
	            $element[0].play();
	        }, true);
	        $scope.$watch("playing", function(newValue, oldValue){
	            if (!(newValue === 'true')) {
                	$element[0].pause();
                }
	        }, true);
    	}
	};
});

app.directive('bar', function() {
	return {
		restrict: 'A',
		template: '<span> | </span><span ng-transclude></span>',
		transclude: true
	};
});