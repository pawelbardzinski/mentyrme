angular.module('app').controller('MentorAccountCtrl', ['$scope', function($scope) {
  var user = gon.user
  $scope.user = {}
  if (user){
    user = angular.fromJson(user)
    $scope.user.email = user.email
    $scope.user.first_name = user.first_name
    $scope.user.last_name = user.last_name
    $scope.user.funding_email = user.email

  }
}]);
