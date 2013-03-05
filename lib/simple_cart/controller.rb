module SimpleCart
  module Controller
    def load_cart
      if params[:id].presence
        @cart = Cart.find_by_id(params[:id])
      elsif cookies[:cart_id].presence
        @cart = Cart.find_by_id(cookies[:cart_id])
      else
        @cart = Cart.create()
        cookies[:cart_id] = @cart.id
      end
    end
  end
end