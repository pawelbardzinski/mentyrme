class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :pay_to_mentor_id, default: nil
      t.string :title, default: nil
      t.decimal :amount, default: 0.0
      t.string :state, default: "not paid"
      t.string :braintree_transaction_id, default: nil
      t.timestamps null: false
    end
  end
end
