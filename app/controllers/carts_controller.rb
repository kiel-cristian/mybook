class CartsController < ApplicationController
  before_filter :load_cart

  def checkout
  end

  def confirm_data
  end

  def pay
  end

  def add_item
    id = params[:item_id]
    type = params[:itemable_type]
    item = type.constantize.find_by_id(id)

    @cart.add_item item
    return_to_load_page
  end

  def remove_item
  end

end
