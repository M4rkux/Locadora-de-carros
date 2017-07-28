var app = angular.module('myApp', ['ngRoute']);

app.config(['$locationProvider', '$routeProvider', function ($locationProvider, $routeProvider) {
        
    $routeProvider.when('/ListagemCarros', {
        templateUrl: '/App/Views/Carros.html',
        controller: 'CarrosController'
    }).when('/NovoCarro', { 
        templateUrl: '/App/Views/AddCarro.html',
        controller: 'CarrosNovoController'
    })
    .when('/EditarCarro/:id', { 
        templateUrl: '/App/Views/EditCarro.html',
        controller: 'CarrosUpdateController'
    })
    .when('/DeletarCarro/:id', { 
        templateUrl: '/App/Views/DeleteCarro.html',
        controller: 'CarroDeleteController'
    })
    .otherwise({ 
        controller: 'CarrosController'
    })
}]);

app.directive('fileInput', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attributes) {
            element.bind('change', function () {
                $parse(attributes.fileInput)
                    .assign(scope, element[0].files)
                scope.$apply()
            });
        }
    };
}]);