class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :itemable_id
      t.string :itemable_type
      t.text :token

      t.timestamps
    end
  end
end
