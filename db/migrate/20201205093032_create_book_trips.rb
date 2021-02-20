class CreateBookTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :book_trips do |t|
      t.integer :adults, default: 0
      t.integer :children, default: 0
      t.decimal :total_price, precision: 10, scale: 2
      t.boolean :is_paid, default: false
      t.boolean :history, default: false
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
