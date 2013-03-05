require 'active_record/base'
require 'active_record/relation'
require 'action_controller/base'

module SimpleCart
  module Model
    def itemize
      class_attribute :simple_cart_configuration
      self.simple_cart_configuration = { :column => "itemized", :column_type => "boolean", :polymorphic_name => "itemable" }

      if  simple_cart_configuration[:column_type] != 'boolean'
        raise ArgumentError, "'boolean' expected for :column_type option, got #{simple_cart_configuration[:column_type]}"
      end

      if is_itemized?
        return
      else
        include SimpleCart::Core
        # Itemized column
        attr_protected simple_cart_configuration[:column]

        # Polymorphic association
        has_one :item, as: simple_cart_configuration[:polymorphic_name]
      end

    end

    def is_itemized?
      self.included_modules.include?(SimpleCart::Core)
    end
  end

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

  module Core
    def itemized?
      true
    end

    def add_to_cart
      raise "'cart' needs to be loaded before adding item" unless @cart.presence
      @cart.add_item self
    end

  end
end

# Extend ActiveRecord's functionality
ActiveRecord::Base.send :extend, SimpleCart::Model
ActionController::Base.send :extend, SimpleCart::Controller
