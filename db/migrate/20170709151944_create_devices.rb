class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :country_produce
      t.integer :year_produce
      t.integer :year_use
      t.integer :unit
      t.integer :unit_price
      t.integer :quantity_account_book
      t.integer :quantity_actual_inventory
      t.integer :quantity_redundancy
      t.integer :quantity_missing
      t.string :note
      t.string :source
      t.string :status
      t.references :department, foreign_key: true
      t.timestamps
    end
  end
end
