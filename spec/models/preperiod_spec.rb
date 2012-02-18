# == Schema Information
#
# Table name: preperiods
#
#  id              :integer         not null, primary key
#  problem_id      :integer
#  product_id      :integer
#  preperiodnumber :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# == Schema Information
#
# Table name: preperiods
#
#  id              :integer         not null, primary key
#  product_id      :integer
#  preperiodnumber :integer
#  created_at      :datetime
#  updated_at      :datetime
#
require 'spec_helper'

describe Preperiod do

  before(:each) do
    @attr = {
      :product_id => "1",
      :preperiodnumber => "0",
      :problem_id => "1"}
        @user=Factory(:user)                                      #User erzeugen
    @problem=Factory(:problem)                                #Problem erzeugen
    @product=Factory(:product)                                #Produkt mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Preperiod.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id = Preperiod.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should require a preperiodnumber" do
    no_preperiodnumber = Preperiod.new(@attr.merge(:preperiodnumber => ""))
    no_preperiodnumber.should_not be_valid
  end


  it "should reject product_ids that do not exist" do
    wrong_product_id = "9"*51
    wrong_product_id = Preperiod.new(@attr.merge(:product_id => wrong_product_id))
    wrong_product_id.should_not be_valid
  end

  it "should reject strings as input for preperiodnumber" do
    string = "a"
    string = Preperiod.new(@attr.merge(:preperiodnumber => string))
    string.should_not be_valid
  end

  it "should reject floats as input for preperiodnumber" do
    float = "3.4"
    float = Preperiod.new(@attr.merge(:preperiodnumber => float))
    float.should_not be_valid
  end

  it "should accept integers as input for preperiodnumber" do
    integer = "3"
    integer = Preperiod.new(@attr.merge(:preperiodnumber => integer))
    integer.should be_valid
  end
end

