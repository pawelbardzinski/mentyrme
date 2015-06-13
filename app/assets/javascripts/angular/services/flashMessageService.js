app.factory('FlashMessage', ['$rootScope', function($rootScope) {
  return {
    clear: function () {
      $rootScope.flash = null;
      $rootScope.alert = null;
      return null;
    },
    show: function (message, success) {
      $rootScope.flash = message;
      if(success) {
        $rootScope.alert = 'alert-success';
      } else {
        $rootScope.alert = 'alert-danger';
      }
      return message;
    }
  };
}]);
