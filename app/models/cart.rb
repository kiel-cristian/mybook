class Cart < ActiveRecord::Base
  attr_accessible :owner_id, :owner_type
end
