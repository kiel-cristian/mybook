require 'active_record/base'
require 'active_record/relation'
require 'action_controller/base'

require 'simple_cart/model'
require 'simple_cart/controller'

module SimpleCart
  maatr_accesor :itemize

  def itemize
    class_attribute :simple_cart_configuration
    self.simple_cart_configuration = { :column => "itemized", :column_type => "boolean", :polymorphic_name => "itemable" }

    if  simple_cart_configuration[:column_type] != 'boolean'
      raise ArgumentError, "'boolean' expected for :column_type option, got #{simple_cart_configuration[:column_type]}"
    end

    if is_itemized?
      return
    else
      include SimpleCart::Model
      # Itemized column
      # attr_protected simple_cart_configuration[:column]

      # Polymorphic association
      has_one :item, as: simple_cart_configuration[:polymorphic_name]
    end
  end

  def is_itemized?
    self.included_modules.include?(SimpleCart::Model)
  end
end

# Extend ActiveRecord's functionality
ActiveRecord::Base.send :extend, SimpleCart

# Extend ActiveRecord's functionality
ActiveRecord::Base.send :include, SimpleCart::Model

# Extend ActionController's functionality
ActionController::Base.send :extend, SimpleCart::Controller
