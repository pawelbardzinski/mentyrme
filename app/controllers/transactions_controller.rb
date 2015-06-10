class TransactionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@transactions = Transaction.where(user_id: current_user.id)
		@mentor_first_name = []
		@mentor_last_name = []
		@transactions.each do |t|
			user = User.find(t.pay_to_mentor_id)
			@mentor_first_name << user.first_name
			@mentor_last_name << user.last_name
		end
	end

end
