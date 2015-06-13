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
		gon.user = current_user.attributes.to_json
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

		if transaction.state == 'escrow'

			result = Braintree::Transaction.release_from_escrow(transaction.braintree_transaction_id)

			if result.success?

				transaction.update(state: :completed)
				flash[:notice] = "Escrow released, Transaction is completed."

			else

				flash[:alert] = "Can't release Escrow Funds. Please contact us. Transaction ID is #{transaction.braintree_transaction_id}"

			end

			redirect_to action: :transaction_result
			return

		end


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
   			options: { submit_for_settlement: true, hold_in_escrow: true }

		)

		current_transaction_id = result.transaction.id

		if result.success?

			# escrow_result = Braintree::Transaction.hold_in_escrow(current_transaction_id)

#			if escrow_result.success?

				transaction.update(state: :escrow, braintree_transaction_id: current_transaction_id)
 				flash[:notice] = "Funds are now in the Escrow Account" # with #{current_user.default_card_id}"

 			else

 				flash[:alert] = "Can't keep funds in Escrow"

 			end

=begin
 			Rolling transaction back..."
 				cancel_result = Braintree::Transaction.cancel_release(current_transaction_id)

 				if cancel_result.success?

 					flash[:notice] = "Transaction #{current_transaction_id} cancelled successfully"

 				else

 					flash[:notice] = "Contact us, transaction #{current_transaction_id} couldn't be cancelled"

 				end

 			end
=end





=begin
		else

			flash[:alert] = "Something is amiss. #{result.errors.each do |error| puts error.message end }"

		end
=end

  		redirect_to action: :transaction_result

	end

	def release_escrow

		transaction = Transaction.find(params[:transaction_id])

		if transaction.state == 'escrow'

			result = Braintree::Transaction.release_from_escrow(transaction.braintree_transaction_id)

			if result.success?

				transaction.update(state: :completed)
				flash[:notice] = "Escrow released, Transaction is completed."

			else

				flash[:alert] = "Can't release Escrow Funds. Please contact us. The Transaction ID is #{transaction.braintree_transaction_id}\n#{result.errors.each do |error| puts error.message end }"

			end

		end

		redirect_to action: :transaction_result
		return

	end

=begin
	def release_escrow

		result = Braintree::Transaction.release_from_escrow(params[:transaction_id])

		if result.success?

			transaction.update(state: :escrow)



	end
=end

	def transaction_result

	end

	def card_added

	end

	def mentor_save
		unless params[:account_number]

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

		else

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
	    			destination: Braintree::MerchantAccount::FundingDestination::Bank,
    				email: params[:funding_email],
    				account_number: params[:account_number],
    				routing_number: params[:routing_number],
  				},
  				:tos_accepted => true

	  		)

		end


  		if result.success?
  			current_user.update(merchant_account_id: result.merchant_account.id)
				render json: { ok: "Saved" }, status: 201
			else
				render json: { error: "Something is amiss: #{result.errors.map do |error| error.message end.join(" ")}" }, status: 403
			end

  		# redirect_to action: :transaction_result

	end

end
