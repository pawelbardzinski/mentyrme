# Load testing data.
# Run using the command 'rake app:load_demo_data'
# task :load_demo_data => [:environment] do

# Only data not required in production should be here.
# If it needs to be there in production, it belongs in seeds.rb.

namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :load_demo_data => [:environment] do

  # Only data not required in production should be here.
  # If it needs to be there in production, it belongs in seeds.rb.

  User.delete_all
  Transaction.delete_all

  user1 = User.create(email: "none@gmail.com", first_name: "Johnny", last_name: "Mnemonic", zip_code: "91789", password: 'verylongpassword1!')
	user2 = User.create(email: "none5@none.com", first_name: "Princess", last_name: "Leya", role: 1, zip_code: "91789", merchant_account_id: "princess_princess_instant_668nxqgs", password: 'verylongpassword1!')
	user3 = User.create(email: "none4@none.com", first_name: "Han", last_name: "Solo", role: 1, zip_code: "91789", merchant_account_id: "han_han_instant_qwpznfhy", password: 'verylongpassword1!')
	user4 = User.create(email: "none3@none.com", first_name: "Luke", last_name: "Skywalker", role: 1, zip_code: "91789", merchant_account_id: "luke_luke_instant_rggxzxrg", password: 'verylongpassword1!')
	user5 = User.create(email: "none2@none.com", first_name: "Palpatine", last_name: "Cosinga", role: 1, zip_code: "91789", merchant_account_id: "palpatine_palpatine_instant_8x9kyk88", password: 'verylongpassword1!')
	user6 = User.create(email: "none@none.com", first_name: "Chewbacca", last_name: "Wookiee", role: 1, zip_code: "91789", merchant_account_id: "chewbacca_chewbacca_instant_h2g64qhy", password: 'verylongpassword1!')

	Transaction.create(user_id: user1.id, pay_to_mentor_id: user5.id, title: "Teach me how to run an Empire", amount: 999.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user6.id, title: "I want to Growl really loud", amount: 15.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user4.id, title: "I want to Destroy a Death Star", amount: 125.00, state: 'completed')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user3.id, title: "Teach me how to Exceed Speed of Light", amount: 1250.00, state: 'completed')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user3.id, title: "Please teach me how to smuggle contraband", amount: 100.00, state: 'future')
	Transaction.create(user_id: user1.id, pay_to_mentor_id: user2.id, title: "I want to have Royal Manners", amount: 250.00, state: 'future')

  # Other test data should be added here...

  end
end
