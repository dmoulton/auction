# app/assets/javascripts/angular/controllers/episodes_ctrl.js.coffee

@AuctionsCtrl = @app.controller 'AuctionsCtrl', ["$scope", "$http", ($scope, $http) ->
  $scope.items = []
  $scope.bid

  loadItems =  ->
    $http.get("/items.json").success((data, status, headers, config) ->
      angular.forEach data, (i) ->
        $scope.items.push i
    )

  $scope.showItem = (item) ->
    $scope.selectedItem = item

  loadItems()
]