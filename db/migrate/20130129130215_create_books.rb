class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :tittle
      t.string :author
      t.datetime :date

      t.timestamps
    end
  end
end
