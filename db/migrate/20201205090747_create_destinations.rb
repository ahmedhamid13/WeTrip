class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :en_name, null: false
      t.text :en_description
      t.string :ar_name, null: false
      t.text :ar_description

      t.timestamps
    end
  end
end
