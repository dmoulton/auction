@AuctionsCtrl = @app.controller 'AuctionsCtrl', ["$scope", "$http", "$resource", "$location","localStorageService", ($scope, $http, $resource, $location, localStorageService) ->
  $scope.items = []
  $scope.bid = {}
  $scope.master= angular.copy($scope.bid)
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
    $scope.min_bid = $scope.selectedItem.max_bid + $scope.selectedItem.min_increment

    #load in from local storage. OK if they are empty
    $scope.bid.name = localStorageService.get('name')
    $scope.bid.address = localStorageService.get('address')
    $scope.bid.phone = localStorageService.get('phone')
    $scope.bid.email = localStorageService.get('email')
    $scope.bid.attending = localStorageService.get('attending')

    $scope.highBidder = false
    $scope.bidError = false

  $scope.placeBid = ->
    if $scope.saveInfo
      localStorageService.add('name',$scope.bid.name)
      localStorageService.add('address',$scope.bid.address)
      localStorageService.add('phone',$scope.bid.phone)
      localStorageService.add('email',$scope.bid.email)
      localStorageService.add('attending',$scope.bid.attending)
    else
      localStorageService.clearAll()

    Bid.save
      bid: $scope.bid
    , ((data, status, headers, config) ->
        $scope.highBidder = true
        $scope.bidError = false
      ), (data, status, headers, config) ->
        $scope.biddingError = data.data.base.join('<br />')
        $scope.highBidder = false
        $scope.bidError = true

    $scope.bid.amount = ''

  getById = (input, id) ->
    i = 0
    len = input.length
    while i < len
      return input[i]  if +input[i].id is +id
      i++
    null

  $scope.isUnchanged = (bid) ->
    return angular.equals(bid, $scope.master)
]