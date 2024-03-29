class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :en_title, null: false
      t.text :en_body
      t.string :ar_title, null: false
      t.text :ar_body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
