class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :itemable_id, null: false
      t.string :itemable_type, null: false
      t.text :token, null: false
      t.integer :cart_id, null: false

      t.timestamps
    end
  end
end
