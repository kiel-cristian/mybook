class CartsController < ApplicationController
  before_filter :load_cart

  def checkout
  end

  def confirm_data
  end

  def pay
  end

  def add_item
    id = params[:itemable_id]
    type = params[:itemable_type]
    item = type.constantize.find_by_id(id)
    @cart.add_item item
    return_to_load_page
  end

  def remove_item
    id = params[:itemable_id]
    type = params[:itemable_type]
    @cart.items.where(itemable_id: id, itemable_type: type).delete_all
    return_to_load_page
  end

end
