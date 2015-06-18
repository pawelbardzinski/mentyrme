var app;
app = angular.module('app', ['ngResource', 'rails', 'ui.bootstrap'] );
app.config(['$httpProvider', function($httpProvider) {
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
}]);
