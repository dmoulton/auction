@BidsCtrl = @app.controller 'BidsCtrl', ["$scope", "$http", "$window", ($scope, $http, $window) ->
  $scope.authenticated = false

  loadBids = () ->
    $http.get("/bids.json").success((data, status, headers, config) ->
      $scope.bids = []
      angular.forEach data, (b) ->
        $scope.bids.push b
    )

  #loadBids()

  loadItems = () ->
    $http.get("/items.json").success((data, status, headers, config) ->
      $scope.items = []
      angular.forEach data, (i) ->
        $scope.items.push i
    )

  #loadItems()

  $scope.showItem = (item) ->
    $scope.item_name = item.name

  $scope.predicate = "-amount"

  $scope.$watch (->
    $scope.authenticated
  ), (value) ->
    if value == true
      loadBids()
      loadItems()

]
