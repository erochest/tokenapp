require 'spec_helper'

describe FreqController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'freq'" do
    it "returns http success" do
      get 'freq'
      response.should be_success
    end
  end

end
