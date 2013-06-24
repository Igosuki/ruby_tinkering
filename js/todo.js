function TodoCtrl($scope) {
	$scope.getTotalTodos = function() {
        return $scope.todos.length;
    }
	$scope.todos = [
		{text: "One Do", done: true},
		{text: "Two Dos", done: false}
	];

    $scope.addTodo = function() {
        $scope.todos.push({text: $scope.formTodoText, done: false});
    }

    $scope.clearCompleted = function() {
        $scope.todos = _.filter($scope.todos, function(todo) {
            return !todo.done;
        });
    }
}