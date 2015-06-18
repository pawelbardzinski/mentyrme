class AccountsController < ApplicationController
	before_action :authenticate_user!

	def index

		@user = current_user
		@client_token = Braintree::ClientToken.generate 
		@mentors = User.where("users.merchant_account_id IS NOT NULL")
		credit_cards = Braintree::Customer.find(current_user.braintree_id).credit_cards if current_user.braintree_id != nil
		if @mentors.include?(@user)
			@mentor_braintree_address = Braintree::MerchantAccount.find(@user.merchant_account_id)
		end

		
		if current_user.braintree_id && credit_cards.size > 0

			@default_payment = []
			credit_cards.each do |credit_card|
				move_on = false
				@default_payment.each do |dp|
					move_on = true if credit_card.last_4 == dp.last_4 && credit_card.bin == dp.bin && credit_card.expiration_month == dp.expiration_month && credit_card.expiration_year == dp.expiration_year
				end
				@default_payment << credit_card unless move_on 
			end

		else

			@default_payment = nil

		end

	end

	def index_mentor

		@user = current_user

	end

	def create

		nonce = params[:payment_method_nonce]

		if current_user.braintree_id == nil 

			result = Braintree::Customer.create(
				first_name: params[:first_name],
				last_name: params[:last_name],
				email: params[:email]
			) 
		
			current_user.update(braintree_id: result.customer.id)

		end

		result = Braintree::PaymentMethod.create(
			customer_id: current_user.braintree_id, # '11613291', 
			payment_method_nonce: nonce # "nonce-from-the-client", 
		)  		


		if result.success?

			current_user.update(default_card_id: result.payment_method.token)
 				
  			flash[:notice] = "Card Saved Successfuly." 

		else 
  			
			flash[:alert] = "Something is amiss. #{result.errors.each do |error| puts error.message end }" 

		end
  		
  		redirect_to action: :card_added

	end

	def pay

		nonce = params[:payment_method_nonce]
		transaction = Transaction.find(params[:transaction][:id])
		mentor_merchant_id = User.find(transaction.pay_to_mentor_id).merchant_account_id
		amount = transaction.amount
		service_fee = amount / 5.0

		if current_user.braintree_id == nil 

			result = Braintree::Customer.create(
				first_name: params[:first_name],
				last_name: params[:last_name],
				email: params[:email]
			) 
		
			current_user.update(braintree_id: result.customer.id)

		end


		if params[:card] != nil

			cards = Braintree::Customer.find(current_user.braintree_id).credit_cards
			cards.each do |card|
				current_user.update(default_card_id: card.token) if card.last_4 == params[:card][:last_4] && card.expiration_month == params[:card][:expiration_month] && card.expiration_year == params[:card][:expiration_year] && card.card_type == params[:card][:type] 	
			end

		else

			payment_method = Braintree::PaymentMethod.create(
				customer_id: current_user.braintree_id, # '11613291', 
				payment_method_nonce: nonce # "nonce-from-the-client", 
			)  		

			current_user.update(default_card_id: payment_method.payment_method.token)

		end

		result = Braintree::Transaction.sale(

   			amount: amount,
   			service_fee_amount: service_fee,
   			merchant_account_id: mentor_merchant_id,
   			payment_method_token: current_user.default_card_id,
   			customer_id: current_user.braintree_id,
   			options: { submit_for_settlement: true }

		)

		if result.success?

			transaction.update(state: :completed)
 				
  			flash[:notice] = "Transaction successful." # with #{current_user.default_card_id}" 

		else 
  			
			flash[:alert] = "Something is amiss. #{result.errors.each do |error| puts error.message end }" 

		end
  		
  		redirect_to action: :transaction_result

	end

	def transaction_result

	end

	def card_added

	end

	def mentor_save

		result = Braintree::MerchantAccount.create(

    		master_merchant_account_id: 'nqfdvdc293c94bnr',
    		:individual => {
    			first_name: params[:first_name],
    			last_name: params[:first_name],
    			email: params[:email],
    			:address => {
      				street_address: params[:street_address],
      				postal_code: params[:zip_code],
      				locality: params[:locality],
      				region: params[:state]
    			},
    		date_of_birth: params[:dob]
  			},
  			:funding => {
    			destination: Braintree::MerchantAccount::FundingDestination::Email,
    			email: params[:funding_email],
  			},
  			:tos_accepted => true

  		)		


  		if result.success?

  			current_user.update(merchant_account_id: result.merchant_account.id)
 				
  			flash[:notice] = "Saved." 

		else 
  			
			flash[:alert] = "Something is amiss. #{result.errors.each do |error| puts error.message end }" 

		end
  		
  		redirect_to action: :transaction_result

	end

end