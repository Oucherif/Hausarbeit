require 'spec_helper'

describe AddcapcostsController do

  describe "GET 'view'" do
    it "should be successful" do
      get 'view'
      response.should be_success
    end
  end
end
