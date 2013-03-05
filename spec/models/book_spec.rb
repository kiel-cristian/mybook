require 'spec_helper'

describe Book do
  # attributes

  it "should respond to :author" do
   should respond_to :author
  end
  it "should respond to :date" do
   should respond_to :date
  end
  it "should respond to :tittle" do
   should respond_to :tittle
  end
  it "should respond to :pricing" do
   should respond_to :pricing
  end
  it "should respond to :item" do
   should respond_to :item
  end

  # associations
  it "should have one item" do
    should have_one :item
  end
end
