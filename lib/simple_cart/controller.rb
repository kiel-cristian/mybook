module SimpleCart
  module Controller

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def load_cart
        if cookies[:cart_id].presence
          @cart = Cart.find_by_id(cookies[:cart_id])
        end

        if not @cart.presence
          @cart = Cart.create()
          cookies[:cart_id] = @cart.id
        end
      end
    end
  end
end