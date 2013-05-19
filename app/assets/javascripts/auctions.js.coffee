@app = angular.module('Auctions', ['ngResource','LocalStorageModule']).config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true).hashPrefix('!');
  $routeProvider.when("/",
    templateUrl: '/partials/auction-template.html'
  ).when("/auctions/:itemId",
    templateUrl: '/partials/auction-template.html'
  ).when("/bids/",
    templateUrl: '/partials/bid-template.html'
  ).otherwise redirectTo: "/"
]