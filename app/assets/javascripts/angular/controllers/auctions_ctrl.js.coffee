@AuctionsCtrl = @app.controller 'AuctionsCtrl', ["$scope", "$http", "$resource", "$location","localStorageService", ($scope, $http, $resource, $location, localStorageService) ->
  $scope.bid = {}
  $scope.master= angular.copy($scope.bid)
  Bid = $resource("/bids/:id", {id: "@id"}, {update: {method: "PUT"}})

  loadItems = (item_id=null) ->
    initial_item = null
    $http.get("/items.json").success((data, status, headers, config) ->
      $scope.items = []
      angular.forEach data, (i) ->
        $scope.items.push i
      if item_id
        initial_item = getById($scope.items,item_id)
        #console.log "item_id was passed in"
      else
        initial_item = getById($scope.items,($location.search()).item_id)

      $scope.showItem(initial_item) if initial_item
    )

  loadItems()

  $scope.showItem = (item) ->
    $scope.selectedItem = item
    $scope.bid = {}
    $scope.bid.item_id = item.id if item
    $scope.min_bid = $scope.selectedItem.max_bid + $scope.selectedItem.min_increment
    $scope.images = $scope.selectedItem.image_url.split(',')
    $scope.firstImage = $scope.images.shift()


    #load in from local storage. OK if they are empty
    $scope.bid.name = localStorageService.get('name')
    $scope.bid.address = localStorageService.get('address')
    $scope.bid.phone = localStorageService.get('phone')
    $scope.bid.email = localStorageService.get('email')
    $scope.bid.attending = localStorageService.get('attending')

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