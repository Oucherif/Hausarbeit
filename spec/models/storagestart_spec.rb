# == Schema Information
#
# Table name: storagestarts
#
#  id                :integer         not null, primary key
#  product_id        :integer
#  storagestartvalue :float
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Storagestart do

  before(:each) do
    @attr = {
      :product_id => "1",
      :storagestartvalue => "0"}
    @product=Factory(:product)                                #Product mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Storagestart.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id = Storagestart.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should require a storagestartvalue" do
    no_storagestartvalue = Storagestart.new(@attr.merge(:storagestartvalue => ""))
    no_storagestartvalue.should_not be_valid
  end

  it "should reject product_ids that do not exist" do
    wrong_product_id = "9"*51
    wrong_product_id = Storagestart.new(@attr.merge(:product_id => wrong_product_id))
    wrong_product_id.should_not be_valid
  end

  it "should reject strings as input for storagestartvalue" do
    string = "a"
    string = Storagestart.new(@attr.merge(:storagestartvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for storagestartvalue" do
    float = "3.4"
    float = Storagestart.new(@attr.merge(:storagestartvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for storagestartvalue" do
    integer = "3"
    integer = Storagestart.new(@attr.merge(:storagestartvalue => integer))
    integer.should be_valid
  end

end

