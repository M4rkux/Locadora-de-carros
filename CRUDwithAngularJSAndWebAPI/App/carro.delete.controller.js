app.controller('CarroDeleteController', ['$scope', '$http', '$location', '$routeParams', function ($scope, $http, $location, $routeParams) {

    $scope.Close = function () {
        $location.path('/ListagemCarros');
    }

    if ($routeParams.id) {
        $scope.Id = $routeParams.id;

        $http.get('api/carros/GetCarro/' + $scope.Id).success(function (data) {
            $scope.Cor = data.Cor;
            $scope.Ano = data.Ano;
            $scope.Modelo = data.Modelo;
        });

    }

    //Delete the selected employee from the list
    $scope.Delete = function () {
        if ($scope.Id > 0) {

            $http.delete("api/carros/DeleteCarro/" + $scope.Id).success(function (data) {
                $location.path('/ListagemCarros');
            }).error(function (data) {
                console.log(data);
                $scope.error = "Something wrong when adding Deleting employee " + data.ExceptionMessage;
            });
        }

    }
}]);