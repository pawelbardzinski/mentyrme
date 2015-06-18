angular.module('app').controller('TransactionsCtrl', ['$scope', function($scope) {
  $scope.transactions = angular.fromJson(gon.transactions);
  $scope.firstNames = angular.fromJson(gon.firstNames);
  $scope.lastNames = angular.fromJson(gon.lastNames);
  $scope.transactionStatus = {};
  $scope.transactionStatus.value = "";
  $scope.transactionStatus.label = "All";

  $scope.setTransactionStatus = function(status) {
    $scope.transactionStatus.value = status.value;
    $scope.transactionStatus.label = status.label;
  }
  $scope.items = [{
    value: "",
    label: "All"
  }, {
    value: "completed",
    label: "Completed"
  }, {
    value: "future",
    label: "Future"
  }, {
    value: "escrow",
    label: "Escrow"
  }];

  $scope.selectedState = $scope.items[0].value

  $scope.status = {
    isopen: false
  };

  $scope.toggleDropdown = function($event) {
    $event.preventDefault();
    $event.stopPropagation();
    $scope.status.isopen = !$scope.status.isopen;
  };
}]);
