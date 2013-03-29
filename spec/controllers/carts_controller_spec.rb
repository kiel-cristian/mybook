require 'spec_helper'

describe CartsController do

  describe "POST 'add_item'" do
    xit "returns http success" do
      post 'add_item'
      response.should be_success
    end
  end

  describe "POST 'remove_item'" do
    xit "returns http success" do
      delete 'remove_item'
      response.should be_success
    end
  end

  describe "POST 'checkout'" do
    xit "returns http success" do
      post 'checkout'
      response.should be_success
    end
  end

  describe "POST 'pay'" do
    xit "returns http success" do
      post 'pay'
      response.should be_success
    end
  end

  describe "POST 'confirm_data'" do
    xit "returns http success" do
      post 'confirm_data'
      response.should be_success
    end
  end

end
