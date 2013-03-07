module CartsHelper
  def add_to_cart_link item, options = {}
      if not @cart
        raise 'Needs to load cart'
      end

      link_to "Add", add_item_cart_path(@cart, { itemable_id: item.id, itemable_type: item.class.name })
    end
end