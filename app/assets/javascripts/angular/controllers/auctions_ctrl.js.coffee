@AuctionsCtrl = @app.controller 'AuctionsCtrl', ["$scope", "$http", "$resource", "$location","$route","$routeParams", "localStorageService", ($scope, $http, $resource, $location, $route, $routeParams, localStorageService) ->
  $scope.bid = {}
  $scope.master= angular.copy($scope.bid)
  Bid = $resource("/bids/:id", {id: "@id"}, {update: {method: "PUT"}})

  loadItems = (itemId=null) ->
    initial_item = null
    $http.get("/items.json").success((data, status, headers, config) ->
      $scope.items = []
      angular.forEach data, (i) ->
        $scope.items.push i
      if itemId
        initial_item = getById($scope.items,itemId)
      else
        initial_item = getById($scope.items,$routeParams.itemId)
      $scope.showItem(initial_item) if initial_item
    )

  loadItems()

  $scope.showItem = (item) ->
    $location.path('/auctions/' + item.id)
    $scope.selectedItem = item

    $scope.currentImageId = -1
    $scope.nextImage()

    $scope.bid = {}
    $scope.bid.item_id = item.id if item
    $scope.min_bid = $scope.selectedItem.max_bid + $scope.selectedItem.min_increment

    $scope.bid.name = localStorageService.get('name')
    $scope.bid.address = localStorageService.get('address')
    $scope.bid.phone = localStorageService.get('phone')
    $scope.bid.email = localStorageService.get('email')
    $scope.bid.attending = localStorageService.get('attending')

  $scope.nextImage = ->
    $scope.currentImageId += 1
    $scope.currentImageId = 0 if $scope.currentImageId >= $scope.selectedItem.image_url.split(',').length
    $scope.currentImage = $scope.selectedItem.image_url.split(',')[$scope.currentImageId]

  $scope.placeBid = ->
    Bid.save
      bid: $scope.bid
    , ((data, status, headers, config) ->
        $scope.highBidder = true
        $scope.bidError = false
        $scope.selectedItem.max_bid = $scope.bid.amount
        $scope.selectedItem.num_bids += 1
        $scope.bid.amount = ''
        loadItems()
        saveInfo()
      ), (data, status, headers, config) ->
        $scope.biddingError = data.data.base.join('<br />')
        $scope.highBidder = false
        $scope.bidError = true
        loadItems($scope.selectedItem.id)
        saveInfo()

    loadItems()

  $scope.resetForm = ->
    $scope.bid.name = ""
    $scope.bid.address = ""
    $scope.bid.phone = ""
    $scope.bid.email = ""
    $scope.bid.attending = ""
    $scope.bid.amount = ""
    localStorageService.clearAll()

  $scope.isUnchanged = (bid) ->
    return angular.equals(bid, $scope.master)

  $scope.$watch (->
    $scope.bid.phone
  ), (value) ->
    if $scope.bid and $scope.bid.phone
      $scope.bid.phone = $scope.bid.phone.replace(/\D/g,'');

  $scope.$watch (->
    $scope.bid.amount
  ), (value) ->
    if $scope.bid and $scope.bid.amount
      $scope.bid.amount = $scope.bid.amount.replace(/\D/g,'');

  saveInfo = ->
    if $scope.saveInfo
      localStorageService.add('name',$scope.bid.name)
      localStorageService.add('address',$scope.bid.address)
      localStorageService.add('phone',$scope.bid.phone)
      localStorageService.add('email',$scope.bid.email)
      localStorageService.add('attending',$scope.bid.attending)
    else
      localStorageService.clearAll()
    $scope.bid.amount = ''

  getById = (input, id) ->
    i = 0
    len = input.length
    while i < len
      return input[i]  if +input[i].id is +id
      i++
    null
]