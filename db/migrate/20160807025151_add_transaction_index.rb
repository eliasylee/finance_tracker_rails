class AddTransactionIndex < ActiveRecord::Migration
  def change
    add_index :transactions, :report_id
  end
end
