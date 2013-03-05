class Item < ActiveRecord::Base

  # attributes
  attr_accessible :token, :itemable_type, :itemable_id, :cart_id

  # associations
  belongs_to :cart
  belongs_to :itemable, polymorphic: true

  # validations
  validates_presence_of :cart_id, :itemable_id, :itemable_type, :token
  validates_uniqueness_of :cart_id, scope: [:itemable_id]
end
