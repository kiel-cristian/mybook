class Item < ActiveRecord::Base
  attr_accessible :itemable_id, :itemable_type, :token
end
