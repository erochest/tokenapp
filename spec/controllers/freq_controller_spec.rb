require 'spec_helper'

describe FreqController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector('title',
                                    :content => 'Token Frequencies')
    end

    it "should have a place for the user to copy and paste in a text document" do
      get 'home'
      response.should have_selector('textarea', :id => 'input_text')
    end

    it "should have a submit button" do
      get 'home'
      response.should have_selector('input', :type => 'submit', :value => 'Submit')
    end
  end

  describe "POST 'freq'" do
    it "returns http success" do
      post 'freq'
      response.should be_success
    end
  end

end
