# == Schema Information
#
# Table name: capusages
#
#  id            :integer         not null, primary key
#  problem_id    :integer
#  product_id    :integer
#  segment_id    :integer
#  preperiod_id  :integer
#  capusagevalue :float
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Capusage do

  before(:each) do
    @attr = {
      :product_id => "1",
      :segment_id => "1",
      :preperiod_id => "1",
      :capusagevalue => "0",
      :problem_id => "1"}

    @user=Factory(:user)                                      #User erzeugen
    @problem=Factory(:problem)                                #Problem erzeugen
    @product=Factory(:product)                                #Product mit ID 1 erzeugen
    @segment=Factory(:segment)                                #Segment mit ID 1 erzeugen
    @preperiod=Factory(:preperiod)                            #Preperiod mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Capusage.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id = Capusage.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should require a segment_id" do
    no_segment_id = Capusage.new(@attr.merge(:segment_id => ""))
    no_segment_id.should_not be_valid
  end

  it "should require a preperiod_id" do
    no_preperiod_id = Capusage.new(@attr.merge(:preperiod_id => ""))
    no_preperiod_id.should_not be_valid
  end

  it "should require a capusagevalue" do
    no_capusagevalue = Capusage.new(@attr.merge(:capusagevalue => ""))
    no_capusagevalue.should_not be_valid
  end

  it "should reject product_ids that do not exist" do
    wrong_product_id = "9"*51
    wrong_product_id = Capusage.new(@attr.merge(:product_id => wrong_product_id))
    wrong_product_id.should_not be_valid
  end

  it "should reject segment_ids that do not exist" do
    wrong_segment_id = "9"*51
    wrong_segment_id = Capusage.new(@attr.merge(:segment_id => wrong_segment_id))
    wrong_segment_id.should_not be_valid
  end

  it "should reject preperiod_ids that do not exist" do
    wrong_preperiod_id = "9"*51
    wrong_preperiod_id = Capusage.new(@attr.merge(:preperiod_id => wrong_preperiod_id))
    wrong_preperiod_id.should_not be_valid
  end

  it "should reject strings as input for capusagevalue" do
    string = "a"
    string = Capusage.new(@attr.merge(:capusagevalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for capusagevalue" do
    float = "3.4"
    float = Capusage.new(@attr.merge(:capusagevalue => float))
    float.should be_valid
  end

  it "should accept integers as input for prodcapvalue" do
    integer = "3"
    integer = Capusage.new(@attr.merge(:capusagevalue => integer))
    integer.should be_valid
  end

end

