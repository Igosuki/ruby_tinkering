function ITunesCtrl($http, $resource, $scope) {
	$scope.searchType = "all";
	$scope.searchTypes = [
		{label: "All", value: "all"},
		{label: "Movie", value: "movie"},
		{label: "Video", value: "musicVideo"},
		{label: "Music", value: "music"},
		{label: "Podcast", value: "podcast"},
		{label: "TV Show", value: "tvShow"}
	];
	$scope.sortCriteria = "artistName";
	$scope.mediaTypes = [
		{label: "Media Type", value: "kind"},
		{label: "Media Item Name", value: "trackName"},
		{label: "Collection Name", value: "collectionName"},
		{label: "Artist", value: "artistName"}
	];
	$scope.searchQuery = "Bob Dylan"
	var iTunesService = $resource("https://itunes.apple.com/search",
		{callback: 'JSON_CALLBACK'}, {get: {method: 'JSONP'}});
	$scope.searchRecords = function() { 
		iTunesService.get({
			term: $scope.searchQuery, 
			media: $scope.searchType
		}, function(result) {
			$scope.records = result.results;
		});
	};

	$scope.play = function(record) {
		$scope.currentVideoUrl = record.previewUrl;
	};
}

angular.module("Todo").directive('videoLoader', function(){
    return function (scope, element, attrs){
        scope.$watch("currentVideoUrl",  function(newValue, oldValue){ 
        	var thing = element.find("source").attr('src', newValue);
            element[0].load();
            element[0].play();
        }, true);
        scope.$watch("showFlag",  function(newValue, oldValue){
            if (!newValue) 
                element[0].pause();
        }, true);
    }
});