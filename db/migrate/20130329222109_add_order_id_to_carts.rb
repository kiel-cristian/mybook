class AddOrderIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :order_id, :string
  end
end
