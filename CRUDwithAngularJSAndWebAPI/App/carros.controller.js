app.controller("CarrosController", ['$scope', '$http', '$location', '$routeParams', function ($scope, $http, $location, $routeParams) {
    $scope.carros;
    $scope.carregando = true;

    $scope.Close = function () {
        $location.path('/ListagemCarros');
    }    

    //Get all employee and bind with html table
    $http.get("api/carros/GetAllCarros").success(function (data) {
        $scope.carros = data;
        $scope.carregando = false;
    });

    //Add new employee
    $scope.Add = function () {
        var employeeData = {
            Cor: $scope.Cor,
            Ano: $scope.Ano,
            KM: $scope.KM,
            Valor: $scope.Valor,
            modelo_id: $scope.Modelo,
            combustivel_id: $scope.Combustivel,
            Imagem: $scope.Imagem,
            cambio_id: $scope.Cambio
        };
        //debugger;
        $http.post("api/carros/AddCarro", employeeData).success(function (data) {
            $location.path('/ListagemCarros');
        }).error(function (data) {
            console.log(data);
            $scope.error = "Something wrong when adding new employee " + data.ExceptionMessage;
        });
    }    
}]);