class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :en_name, null: false
      t.text :en_description
      t.string :en_leaving_place
      t.string :ar_name, null: false
      t.text :ar_description
      t.string :ar_leaving_place
      t.datetime :leaving_time
      t.datetime :returning_time
      t.float :child_price
      t.float :adult_price
      t.integer :currency, default: 0
      t.integer :available_places, default: 0
      t.boolean :is_available, default: false
      t.references :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
