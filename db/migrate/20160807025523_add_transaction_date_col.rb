class AddTransactionDateCol < ActiveRecord::Migration
  def change
    add_column :transactions, :transaction_date, :date
    add_column :transactions, :location, :string
  end
end
