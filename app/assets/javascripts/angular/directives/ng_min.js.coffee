isEmpty = (value) ->
  angular.isUndefined(value) or value is "" or value is null or value isnt value

@app.directive "ngMin", ->
  restrict: "A"
  require: "ngModel"
  link: (scope, elem, attr, ctrl) ->
    scope.$watch attr.ngMin, ->
      ctrl.$setViewValue ctrl.$viewValue

    minValidator = (value) ->
      min = scope.$eval(attr.ngMin) or 0
      if not isEmpty(value) and value < min and value > 0
        ctrl.$setValidity "ngMin", false
        `undefined`
      else
        ctrl.$setValidity "ngMin", true
        value

    ctrl.$parsers.push minValidator
    ctrl.$formatters.push minValidator