app.controller('CarrosUpdateController', ['$scope', '$http', '$location', '$routeParams', '$q', function ($scope, $http, $location, $routeParams, $q) {
    $scope.modelos = [];
    $scope.marcas = [];
    $scope.cambios = [];
    $scope.combustiveis = [];

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
        $http.get('api/modelos/GetAllModelosByMarca/' + $scope.Marca.ID).success(function (data) {
            $scope.modelos = data;
        });
    }

    if ($routeParams.id) {
        $scope.Id = $routeParams.id;

        $http.get('api/carros/GetCarro/' + $scope.Id).success(function (data) {
            $scope.Cor = data.Cor;
            $scope.Ano = data.Ano;
            $scope.modelo_id = data.modelo_id;
            $scope.Modelo = data.Modelo;
            $scope.marca_id = data.Modelo.Marcas.ID;
            $scope.Marca = data.Modelo.Marcas;
            $scope.KM = data.KM;
            $scope.Valor = data.Valor;
            $scope.Imagem = data.Imagem;
            $scope.cambio_id = data.cambio_id;
            $scope.Cambio = data.Cambio;
            $scope.combustivel_id = data.combustivel_id;
            $scope.Combustivel = data.Combustivel;

            $scope.changeMarca($scope.marca_id);
        });

    }

    //Update the employee records
    $scope.Update = function () {
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
            ID: $scope.Id,
            Cor: $scope.Cor,
            Ano: $scope.Ano,
            KM: $scope.KM,
            Valor: $scope.Valor,
            modelo_id: $scope.Modelo.ID,
            combustivel_id: $scope.Combustivel.ID,
            Imagem: $scope.Imagem,
            cambio_id: $scope.Cambio.ID
        };


        if ($scope.files) {
            var promise = create_blob($scope.files[0]);

            promise.then(function (result) {
                var Imagem = result.split('base64,')[1];
                carroData.Imagem = Imagem;

                if ($scope.Id > 0) {
                    $http.put("api/carros/UpdateCarro", carroData).success(function (data) {
                        $location.path('/ListagemCarros');
                    }).error(function (data) {
                        console.log(data);
                        $scope.error = "Something wrong when adding updating employee " + data.ExceptionMessage;
                    });
                }


            });

        } else {

            if ($scope.Id > 0) {
                $http.put("api/carros/UpdateCarro", carroData).success(function (data) {
                    $location.path('/ListagemCarros');
                }).error(function (data) {
                    console.log(data);
                    $scope.error = "Something wrong when adding updating employee " + data.ExceptionMessage;
                });
            }
        }
        
    }
}]);