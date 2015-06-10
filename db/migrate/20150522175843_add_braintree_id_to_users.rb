class AddBraintreeIdToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :braintree_id, default: nil
  		t.string :default_card_id, default: nil
  		t.string :merchant_account_id, default: nil
  	end
  end
end
