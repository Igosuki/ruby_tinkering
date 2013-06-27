angular.module("itunes", ["itunes.services"]).controller('iTunesCtrl', 
function($http, $resource, $cookieStore, $scope, $parse, $location, iTunesSvc) {
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

    $scope.searchRecords = function() { 
		iTunesSvc.get({
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
});