# == Schema Information
#
# Table name: prodcaps
#
#  id           :integer         not null, primary key
#  problem_id   :integer
#  segment_id   :integer
#  timestep_id  :integer
#  prodcapvalue :float
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Prodcap do

  before(:each) do
    @attr = {
      :segment_id => "1",
      :timestep_id => "1",
      :prodcapvalue => "0"}
    @segment=Factory(:segment)                                #Segment mit ID 1 erzeugen
    @timestep=Factory(:timestep)                              #Timestep mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Prodcap.create!(@attr)
  end

  it "should require a segment_id" do
    no_segment_id = Prodcap.new(@attr.merge(:segment_id => ""))
    no_segment_id.should_not be_valid
  end

  it "should require a timestep_id" do
    no_timestep_id = Prodcap.new(@attr.merge(:timestep_id => ""))
    no_timestep_id.should_not be_valid
  end

  it "should require a prodcapvalue" do
    no_prodcapvalue = Prodcap.new(@attr.merge(:prodcapvalue => ""))
    no_prodcapvalue.should_not be_valid
  end

  it "should reject segment_ids that do not exist" do
    wrong_segment_id = "9"*51
    wrong_segment_id = Prodcap.new(@attr.merge(:segment_id => wrong_segment_id))
    wrong_segment_id.should_not be_valid
  end

  it "should reject timestep_ids that do not exist" do
    wrong_timestep_id = "9"*51
    wrong_timestep_id = Prodcap.new(@attr.merge(:timestep_id => wrong_timestep_id))
    wrong_timestep_id.should_not be_valid
  end

  it "should reject strings as input for prodcapvalue" do
    string = "a"
    string = Prodcap.new(@attr.merge(:prodcapvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for prodcapvalue" do
    float = "3.4"
    float = Prodcap.new(@attr.merge(:prodcapvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for prodcapvalue" do
    integer = "3"
    integer = Prodcap.new(@attr.merge(:prodcapvalue => integer))
    integer.should be_valid
  end

end
