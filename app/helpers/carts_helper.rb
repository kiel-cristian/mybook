module CartsHelper
  def make_cart_link item=nil, options = {}, html_options = {}
      if not @cart
        raise 'Needs to load cart'
      end

      item = @item if @item.presence and item.nil?
      opts = { itemable_id: item.id, itemable_type: item.class.name }
      opts = opts.merge options

      if @cart.items.where(itemable_id: opts[:itemable_id], itemable_type: opts[:itemable_type]).presence
        link_to "Remove", remove_item_cart_path(@cart,opts), class: 'btn btn-mini btn-danger', method: :delete
      else
        link_to "Add", add_item_cart_path(@cart, opts), class: 'btn btn-mini'
      end

    end
end