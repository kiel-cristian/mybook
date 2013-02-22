require 'spec_helper'

describe CartsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'add'" do
    it "returns http success" do
      get 'add'
      response.should be_success
    end
  end

  describe "GET 'remove'" do
    it "returns http success" do
      get 'remove'
      response.should be_success
    end
  end

end
