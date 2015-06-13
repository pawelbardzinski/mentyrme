app.factory('Account', ['railsResourceFactory', function(railsResourceFactory) {
  var Account = railsResourceFactory({
    url: '/payment',
    name: 'account',
    rootWrapping: false
  });


  Account.saveMentorTypeBank = function(data) {
    var url = this.resourceUrl() + "/mentor_save";
    req_data = {
      first_name: data.first_name,
      last_name: data.last_name,
      email: data.email,
      street_address: data.street_address,
      zip_code: data.zip_code,
      locality: data.locality,
      region: data.region,
      dob: data.dob,
      routing_number: data.routing_number,
      account_number: data.account_number
    }
    return this.$post(url, req_data);
  };

  Account.saveMentorTypeEmail = function(data) {
    var url = this.resourceUrl() + "/mentor_save";
    req_data = {
      first_name: data.first_name,
      last_name: data.last_name,
      email: data.email,
      street_address: data.street_address,
      zip_code: data.zip_code,
      locality: data.locality,
      region: data.region,
      dob: data.dob,
      funding_email: data.funding_email
    }
    return this.$post(url, req_data);
  };
  return Account;
}]);
