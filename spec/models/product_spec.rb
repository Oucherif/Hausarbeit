# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  productname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Product do

  before(:each) do
    @attr = {
      :productname => "Auto",
      :problem_id => "1",
    }
            @user=Factory(:user)                                      #User erzeugen
    @problem=Factory(:problem)                                #Problem erzeugen
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@attr)
  end

  it "should require a productname" do
    no_productname = Product.new(@attr.merge(:productname => ""))
    no_productname.should_not be_valid
  end

  it "should reject duplicate productnames" do
    Product.create!(@attr)
    duplicate_product = Product.new(@attr)
    duplicate_product.should_not be_valid
  end

end
