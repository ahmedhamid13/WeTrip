class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.time :time, null: false
      t.string :en_name, null: false
      t.string :ar_name, null: false
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
