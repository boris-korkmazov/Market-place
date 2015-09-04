@app.directive 'compareTo', ()->
  return {
    restrict: 'A',
    require: 'ngModel',
    scope:{
      otherModelValue: '=compareTo'
    },
    link: (scope, element, attrs, ngModel)->
      ngModel.$setValidity('compare', true)
      element.on 'blur', (e)->
        scope.$apply(()->
          if not element.val() && not scope.otherModelValue
            ngModel.$setValidity('compare', true)
          else
            if scope.otherModelValue == element.val()
              ngModel.$setValidity('compare', true)
            else
              ngModel.$setValidity('compare', false)
        )

      scope.$watch ()->
        scope.otherModelValue
      , (val) ->
        if not element.val() && not scope.otherModelValue
          ngModel.$setValidity('compare', true)
        else
          if val == element.val()
            ngModel.$setValidity('compare', true)
          else
            ngModel.$setValidity('compare', false)


  }