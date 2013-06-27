angular.module("itunes.services", ['ngResource']).factory('iTunesSvc', function($resource) {
	return $resource("https://itunes.apple.com/search",
		{
			callback: 'JSON_CALLBACK'
		}, 
		{
			get: {method: 'JSONP'}
		}
	);
});