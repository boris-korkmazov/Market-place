@app.controller 'LessonsController', ['$scope', '$http', ($scope, $http)->
  $scope.upLike = ->
    $http.get("/lessons/#{$scope.lessonId}/likes.json", {params:{direct: 'up'}}).then((resp)->
      $scope.likes = resp.data.count
    )

  $scope.downLike = ->
    $http.get("/lessons/#{$scope.lessonId}/likes.json", {params:{direct: 'down'}}).then((resp)->
      $scope.likes = resp.data.count
    )
]