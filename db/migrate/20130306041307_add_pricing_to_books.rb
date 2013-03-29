class AddPricingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :pricing, :integer
  end
end
