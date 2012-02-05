# == Schema Information
#
# Table name: maxaddcaps
#
#  id             :integer         not null, primary key
#  segment_id     :integer
#  timestep_id    :integer
#  maxaddcapvalue :float
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Maxaddcap do

  before(:each) do
    @attr = {
      :segment_id => "1",
      :timestep_id => "1",
      :maxaddcapvalue => "0"}
    @segment=Factory(:segment)                                #Segment mit ID 1 erzeugen
    @timestep=Factory(:timestep)                              #Timestep mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Maxaddcap.create!(@attr)
  end

  it "should require a segment_id" do
    no_segment_id = Maxaddcap.new(@attr.merge(:segment_id => ""))
    no_segment_id.should_not be_valid
  end

  it "should require a timestep_id" do
    no_timestep_id = Maxaddcap.new(@attr.merge(:timestep_id => ""))
    no_timestep_id.should_not be_valid
  end

  it "should require a maxaddcapvalue" do
    no_maxaddcapvalue = Maxaddcap.new(@attr.merge(:maxaddcapvalue => ""))
    no_maxaddcapvalue.should_not be_valid
  end

  it "should reject segment_ids that do not exist" do
    wrong_segment_id = "9"*51
    wrong_segment_id = Maxaddcap.new(@attr.merge(:segment_id => wrong_segment_id))
    wrong_segment_id.should_not be_valid
  end

  it "should reject timestep_ids that do not exist" do
    wrong_timestep_id = "9"*51
    wrong_timestep_id = Maxaddcap.new(@attr.merge(:timestep_id => wrong_timestep_id))
    wrong_timestep_id.should_not be_valid
  end

  it "should reject strings as input for maxaddcapvalue" do
    string = "a"
    string = Maxaddcap.new(@attr.merge(:maxaddcapvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for maxaddcapvalue" do
    float = "3.4"
    float = Maxaddcap.new(@attr.merge(:maxaddcapvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for maxaddcapvalue" do
    integer = "3"
    integer = Maxaddcap.new(@attr.merge(:maxaddcapvalue => integer))
    integer.should be_valid
  end

end
