module SimpleCart
  module Model
    def itemized?
      respond_to :item
    end

    def add_to_cart
      raise "'cart' needs to be loaded before adding item" unless @cart.presence
      @cart.add_item self
    end
  end
end