angular.module("todo.ui.video", []).directive('videoLoader', function(){
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

