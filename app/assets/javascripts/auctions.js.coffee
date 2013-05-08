@app = angular.module('Auctions', ['ngResource']).config ["$routeProvider", ($routeProvider) ->
  $routeProvider.when("/:itemId",
    controller: AuctionsCtrl
  ).otherwise redirectTo: "/"
]