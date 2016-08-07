class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
