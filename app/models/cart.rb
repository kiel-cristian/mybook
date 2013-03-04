class Cart < ActiveRecord::Base
  # attributes
  attr_accessible :owner_id, :owner_type

  # associations
  belongs_to :owner
  has_many :items, as: :itemable, dependent: :destroy

  def checkout
    can_checkout = true
    self.items.map { |item| item.checkout(can_checkout) }

    can_checkout
  end

  def order_id
    SecureRandom.hex(10)
  end

  def add_item item
    self.items.new(item.attributes)
    self.save
  end

  def remove_item item
    self.items.where(id: item.id).delete_all
  end

  def expire_items
    self.items.map { |item| item.expire }
  end

  def update_owner owner
    self.owner_id = owner.id
    self.owner_type = owner.class.name
    self.save
  end
end
