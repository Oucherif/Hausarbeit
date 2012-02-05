# == Schema Information
#
# Table name: storagecosts
#
#  id               :integer         not null, primary key
#  product_id       :integer
#  storagecostvalue :float
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Storagecost do

  before(:each) do
    @attr = {
      :product_id => "1",
      :storagecostvalue => "0"}
    @product=Factory(:product)                                #Product mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Storagecost.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id = Storagecost.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should require a storagecostvalue" do
    no_storagecostvalue = Storagecost.new(@attr.merge(:storagecostvalue => ""))
    no_storagecostvalue.should_not be_valid
  end

  it "should reject product_ids that do not exist" do
    wrong_product_id = "9"*51
    wrong_product_id = Storagecost.new(@attr.merge(:product_id => wrong_product_id))
    wrong_product_id.should_not be_valid
  end

  it "should reject strings as input for storagecostvalue" do
    string = "a"
    string = Storagecost.new(@attr.merge(:storagecostvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for storagecostvalue" do
    float = "3.4"
    float = Storagecost.new(@attr.merge(:storagecostvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for storagecostvalue" do
    integer = "3"
    integer = Storagecost.new(@attr.merge(:storagecostvalue => integer))
    integer.should be_valid
  end

end
