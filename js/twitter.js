function TwitterCtrl($scope, $resource) {
	$scope.twitter = $resource("https://api.twitter.com/1.1/search/:action", 
		{action: 'tweets.json', q: 'angularjs', callback: 'JSON_CALLBACK'},
		{get: {method: 'JSONP'}});
	$scope.twitter.get();
}