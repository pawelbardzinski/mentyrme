class RenameStatusFieldsForTransactions < ActiveRecord::Migration
  def change
    Transaction.all.each do |transaction|
      state = transaction.state == "paid" ? "transactions" : "future"
      transaction.update_attributes(state: state)
    end
    change_column :transactions, :state, :string, :default => "future"
  end
end
