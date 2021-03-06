class Cart < ActiveRecord::Base
  # attributes
  attr_accessible :owner_id, :owner_type, :order_id

  # associations
  belongs_to :owner, polymorphic: true

  has_many :items, dependent: :destroy

  def checkout
    can_checkout = true
    if self.items.presence
      self.items.map { |item| item.checkout(can_checkout) }
    else
      can_checkout = false
    end
    can_checkout
  end

  def new_order_id
    self.order_id = SecureRandom.hex(20).to_s
  end

  def new_item_token
    DateTime.now.to_s + SecureRandom.hex(5).to_s
  end

  def add_item item
    if item.respond_to? :itemized? and item.itemized?
      new_item = self.items.new(itemable_id: item.id, itemable_type: item.class.name )
      new_item.token = self.new_item_token
      id = Item.all.count
      new_item.id = id + 1
      new_item.save
    else
      raise ArgumentError, " Item needs to be itemized in order to be added to cart"
    end
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
