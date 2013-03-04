
require 'spec_helper'

describe Cart do
  # attributes
  it "should respond to owner_id" do
    should respond_to :owner_id
  end

  it "should respond to owner_type" do
    should respond_to :owner_type
  end

  it "should respond to checkout" do
    should respond_to :checkout
  end

  it "should respond to expire_items" do
    should respond_to :expire_items
  end

  it "should respond to order_id" do
    should respond_to :order_id
  end

  it "should respond to update_owner" do
    should respond_to :update_owner
  end

  it "should respond to add_item" do
    should respond_to :add_item
  end

  it "should respond to remove_item" do
    should respond_to :remove_item
  end

  # associations
  it "should have many items" do
    should have_many :items
  end

  it "should belong to owner" do
    should belong_to :owner
  end

  let!(:cart) { FactoryGirl.create(:cart)}

  # validations
  it "should have a valid factory" do
    cart.should be_valid
  end

  it "should not require a owner" do
    FactoryGirl.build(:cart, owner_id: nil, owner_type: nil).should be_valid
  end

  it "should checkout only with items" do
    cart.items.delete_all
    cart.checkout.should be_false
  end

end
