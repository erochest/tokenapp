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
      response.should have_selector('textarea', :id => 'freq_input_text')
    end

    it "should have a submit button" do
      get 'home'
      response.should have_selector('input', :type => 'submit', :value => 'Submit')
    end

    it "should go to freq page when the user submits data" do
      post :freq, :freq => { :input_text => "This is some input.\nMore input." }
      response.should render_template('freq')
    end
  end

  describe "POST 'freq'" do
    it "returns http success" do
      post 'freq', :freq => { :input_text => 'Input.' }
      response.should be_success
    end

    it "should redirect to / if there is no input." do
      post :freq, :freq => { :input_text => "" }
      response.should redirect_to('/')
    end

    it "should redirect to / if the input is empty." do
      post :freq, :freq => { :input_text => " " }
      response.should redirect_to('/')
    end
  end
end
