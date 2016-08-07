class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :report_id, null: false
      t.string :item, null: false
      t.integer :cost, null: false

      t.timestamps null: false
    end
  end
end
