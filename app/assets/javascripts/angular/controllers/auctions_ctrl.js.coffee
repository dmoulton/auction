# app/assets/javascripts/angular/controllers/episodes_ctrl.js.coffee
#@AuctionsCtrl = ($scope, $resource, $http) ->
@AuctionsCtrl = @app.controller 'AuctionsCtrl', ["$scope", "$http", "$resource", "$location", ($scope, $http, $resource, $location) ->
  $scope.items = []
  $scope.bid
  Bid = $resource("/bids/:id", {id: "@id"}, {update: {method: "PUT"}})

  loadItems =  ->
    $http.get("/items.json").success((data, status, headers, config) ->
      angular.forEach data, (i) ->
        $scope.items.push i
      initial_item = getById($scope.items,($location.search()).item_id)
      $scope.showItem(initial_item)
    )

  loadItems()

  $scope.showItem = (item) ->
    $scope.selectedItem = item
    $scope.bid = {item_id: item.id}

  $scope.placeBid = ->
    Bid.save({bid: $scope.bid})
    $scope.bid = {}

  getById = (input, id) ->
    i = 0
    len = input.length
    while i < len

      #convert both ids to numbers to be sure
      return input[i]  if +input[i].id is +id
      i++
    null
]