namespace :app do
  
  desc <<-DESC
    Release all escrow holds
    Runs automatically scheduled at midnight by cronjob
    Run manually using the command 'rake app:escrow_release'
  DESC

  task :escrow_release => [:environment] do

    logger = Logger.new("log/escrow_release_#{Time.now}.log")

	  all_transactions = Transaction.where(state: :escrow)
    all_transactions.each do |transaction|

      bt = Braintree::Transaction.find(transaction.braintree_transaction_id)
      result = Braintree::Transaction.release_from_escrow(bt.id)

      if result.success?

        transaction.update(state: :completed)
        
        logger.info "Escrow released, Transaction #{transaction.braintree_transaction_id} is completed."

      else

        logger.warn "Can't release Escrow Funds. Transaction ID is #{transaction.braintree_transaction_id}"

      end

    end

  end

end

