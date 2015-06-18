angular.module('app').controller('TransactionsCtrl', ['$scope', function($scope) {
  $scope.transactions = angular.fromJson(gon.transactions);
  $scope.firstNames = angular.fromJson(gon.firstNames);
  $scope.lastNames = angular.fromJson(gon.lastNames);
}]);
