@app.directive 'uniq', ['$http','$q',($http, $q)->
  return {
    restrict: 'A'
    require: 'ngModel'
    scope: {
      attribute: '@'
    }
    link: (scope, element, attrs, ngModel)->

      terminateXhr = null

      hasValue = ->

        currentValue = ngModel.$viewValue

        terminateXhr.resolve() if terminateXhr

        terminateXhr = $q.defer()

        $http.get('/users/validate.json', {params: {attribute: scope.attribute, value: currentValue}, timeout: terminateXhr.promise}).then((resp)->

          if not resp.data.count

            ngModel.$setValidity('uniq', true)

          else

            ngModel.$setValidity('uniq', false)

        )

        currentValue

      ngModel.$parsers.push(hasValue)
  }

]