require 'active_record/base'
require 'active_record/relation'
require 'action_controller/base'

require 'simple_cart/model'
require 'simple_cart/controller'

module SimpleCart

  def itemize
    class_attribute :simple_cart_configuration
    self.simple_cart_configuration = { :polymorphic_name => "itemable" }

    if is_itemized?
      return
    else
      include SimpleCart::Model

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

# Extend ActionController's functionality
ActionController::Base.send :include, SimpleCart::Controller
