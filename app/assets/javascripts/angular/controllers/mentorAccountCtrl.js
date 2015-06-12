angular.module('app').controller('MentorAccountCtrl', ['$scope', function($scope) {
  $scope.emailValidator = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
  var user = gon.user
  if (user){
    $scope.user = angular.fromJson(user)
  }
}]);
