var app = angular.module("todo", ["ngResource","ngCookies", "ui.bootstrap", "itunes", "todo.ui", "todo.app"]);
app.config(function ($routeProvider, $httpProvider) {
$routeProvider
    .when('/', {
        templateUrl: 'partials/itunes/index.html',
        controller: 'iTunesCtrl'
    })
    .otherwise({
        redirectTo: '/'
    });
});