angular.module("todo.ui", ["todo.ui.video"]).directive('bar', function() {
	return {
		restrict: 'A',
		template: '<span> | </span><span ng-transclude></span>',
		transclude: true
	};
});