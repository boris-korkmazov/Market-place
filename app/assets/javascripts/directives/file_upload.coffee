@app.directive 'fileUpload', [->
  return {
    restrict: 'A'
    link: (scope, element, attrs)->
      element.bootstrapFileInput()
  }
]