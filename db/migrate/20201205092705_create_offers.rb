class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :en_name, null: false
      t.string :ar_name, null: false
      t.boolean :is_available, default: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
