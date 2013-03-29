require 'spec_helper'

describe Item do
  # attributes

  it "should respond to :itemable_id" do
    should respond_to :itemable_id
  end
  it "should respond to :itemable_type" do
    should respond_to :itemable_type
  end
  it "should respond to :cart_id" do
    should respond_to :cart_id
  end
  it "should respond to :token" do
    should respond_to :token
  end

  # associations

  it "should belong to cart" do
    should belong_to :cart
  end
  it "should belong to itemable" do
    should belong_to :itemable
  end

  let!(:item){ FactoryGirl.create(:item) }

  # validations
  it "should have a valid factory" do
    item.should be_valid
  end
  it "should requiere owner_cart_id" do
    FactoryGirl.build(:item, cart_id: nil).should_not be_valid
  end
  it "should requiere itemable_id" do
    FactoryGirl.build(:item, itemable_id: nil).should_not be_valid
  end
  it "should requiere itemable_type" do
    FactoryGirl.build(:item, itemable_type: nil).should_not be_valid
  end
end
