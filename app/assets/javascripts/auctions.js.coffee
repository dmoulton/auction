@app = angular.module('Auctions', ['ngResource','LocalStorageModule']).config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/:itemId",
    controller: AuctionsCtrl
  ).otherwise redirectTo: "/"
]