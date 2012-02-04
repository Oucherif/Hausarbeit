require 'spec_helper'

describe ProblemsController do


  before do                   #die Bedingung "$current_user==nil" darf nicht erfüllt sein
      @user = Factory(:user)  #da sonst auf startseite verwiesen wird und der Test dann scheitert.
    $current_user = @user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
