
require 'spec_helper'

describe Cart do
  # attributes
  it "respond to owner_id" do
    should respond_to :owner_id
  end

  it "respond to owner_type" do
    should respond_to :owner_type
  end

  it "respond to checkout" do
    should respond_to :checkout
  end

  it "respond to expire_items" do
    should respond_to :expire_items
  end

  it "respond to new_order_id" do
    should respond_to :new_order_id
  end

  it "respond to order_id" do
    should respond_to :order_id
  end

  it "respond to update_owner" do
    should respond_to :update_owner
  end

  it "respond to add_item" do
    should respond_to :add_item
  end

  it "respond to remove_item" do
    should respond_to :remove_item
  end

  it "respond to new_item_token" do
    should respond_to :new_item_token
  end

  # associations
  it "have many items" do
    should have_many :items
  end

  it "should belong to owner" do
    should belong_to :owner
  end

  let!(:cart) { FactoryGirl.create(:cart)}

  # validations
  it "have a valid factory" do
    cart.should be_valid
  end

  it "not require a owner" do
    FactoryGirl.build(:cart, owner_id: nil, owner_type: nil).should be_valid
  end

  it "checkout only with items" do
    cart.items.delete_all
    cart.checkout.should be_false
  end

end
