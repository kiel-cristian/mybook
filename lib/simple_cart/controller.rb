module SimpleCart
  module Controller

    # helper_method :add_cart_link
    # hide_action :load_cart, :add_to_cart_link, :return_to_load_page

    protected

    def load_cart
      if cookies[:cart_id].presence
        @cart = Cart.find_by_id(cookies[:cart_id])
      end

      if not @cart.presence
        @cart = Cart.create()
        cookies[:cart_id] = @cart.id
      end
      @cart
      session[:before_add] = request.referer
    end

    def return_to_load_page
      redirect_to session[:before_add]
    end

  end
end