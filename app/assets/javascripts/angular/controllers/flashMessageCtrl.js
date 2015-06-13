app.controller('FlashMessageController', ['$scope', 'FlashMessage', function ($scope, FlashMessage) {
  $scope.hideMessage = function() {
    FlashMessage.clear();
  };
}]);
