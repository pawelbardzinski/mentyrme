angular.module('app').controller('MentorAccountCtrl', ['$scope', 'Account', 'FlashMessage', function($scope, Account, FlashMessage) {
  var user = gon.user;
  $scope.user = {};
  if (user) {
    user = angular.fromJson(user)
    $scope.user.email = user.email
    $scope.user.first_name = user.first_name
    $scope.user.last_name = user.last_name
    $scope.user.funding_email = user.email
  }

  var resolved = function(response) {
    FlashMessage.clear();
    FlashMessage.show(response.data.success, true);
  };

  var rejected = function(response) {
    FlashMessage.clear();
    FlashMessage.show(response.data.error, true);
  };

  $scope.saveMentorTypeEmail = function() {
    Account.saveMentorTypeEmail($scope.user).then(resolved, rejected);
  }

  $scope.saveMentorTypeBank = function() {
    Account.saveMentorTypeBank($scope.user).then(resolved, rejected);
  }
}]);
