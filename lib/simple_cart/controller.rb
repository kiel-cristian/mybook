module SimpleCart
  module Controller
    protected

    def load_cart model=nil
      if cookies[:cart_id].presence
        @cart = Cart.find_by_id(cookies[:cart_id])
      end

      if not @cart.presence
        @cart = Cart.create()
        cookies[:cart_id] = @cart.id
      end

      if model.presence
        key_id = params[:id] if params[:id].presence
        if not key_id.presence
          key_id = (model.to_s + "_id").to_sym
        end
        item_model = model.to_s.capitalize.constantize

        case params[:action]
        when 'index'
          session[:before_add] = request.referer || root_url
          @items = item_model.all
        when 'show'
          session[:before_add] = request.referer || root_url
          @item = item_model.find_by_id(key_id)
        when 'edit'
          @item = item_model.find_by_id(key_id)
        when 'new'
          @item = item_model.new
        when 'remove'
          @item = item_model.find_by_id(key_id)
        when 'update'
          @item = item_model.find_by_id(key_id)
          @item.assign_attributes(params[:book])
        when 'create'
          @item = item_model.new(params[:book])
        end
      end
    end

    def return_to_load_page
      redirect_to session[:before_add]
    end

  end
end