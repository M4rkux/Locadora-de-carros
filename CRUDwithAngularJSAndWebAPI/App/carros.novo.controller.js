app.controller("CarrosNovoController", ['$scope', '$http', '$location', '$routeParams', '$q', function ($scope, $http, $location, $routeParams, $q) {
    $scope.modelos = [];
    $scope.marcas = [];
    $scope.cambios = [];
    $scope.combustiveis = [];
    $scope.erro;

    $scope.Close = function () {
        $location.path('/ListagemCarros');
    }

    $http.get('api/combustiveis/GetAllCombustiveis').success(function (data) {
        $scope.combustiveis = data;
    });

    $http.get('api/cambios/GetAllCambios').success(function (data) {
        $scope.cambios = data;
    });

    $http.get('api/marcas/GetAllMarcas').success(function (data) {
        $scope.marcas = data;
    });

    $scope.changeMarca = function () {
        $scope.modelos = [];
        $http.get('api/modelos/GetAllModelosByMarca/' + $scope.marca_id).success(function (data) {
            $scope.modelos = data;
        });
    }

    //Add new employee
    $scope.Add = function () {

        function create_blob(file) {
            var deferred = $q.defer();
            var reader = new FileReader();
            reader.onload = function () {
                deferred.resolve(reader.result);
            };
            reader.readAsDataURL(file);
            return deferred.promise;
        }

        var carroData = {
            Cor: $scope.Cor,
            Ano: $scope.Ano,
            KM: $scope.KM,
            Valor: $scope.Valor,
            modelo_id: $scope.modelo_id,
            combustivel_id: $scope.combustivel_id,
            Imagem: undefined,
            cambio_id: $scope.cambio_id
        };


        if ($scope.files) {
            var promise = create_blob($scope.files[0]);

            promise.then(function (result) {
                var Imagem = result.split('base64,')[1];
                carroData.Imagem = Imagem;

                $http.post('api/carros/AddCarro', carroData).success(function (data) {
                    $location.path('/ListagemCarros');
                }).error(function (data) {
                    console.log(data);
                    $scope.error = "Ocorreu um erro ao adicionar um Carro " + data.ExceptionMessage;
                });


            });

        } else {

            $http.post('api/carros/AddCarro', carroData).success(function (data) {
                $location.path('/ListagemCarros');
            }).error(function (data) {
                console.log(data);
                $scope.error = "Ocorreu um erro ao adicionar um Carro " + data.ExceptionMessage;
            });
        }
    }
}]);