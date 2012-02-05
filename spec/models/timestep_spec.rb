# == Schema Information
#
# Table name: timesteps
#
#  id         :integer         not null, primary key
#  stepnumber :integer
#  created_at :datetime
#  updated_at :datetime
#
require 'spec_helper'

describe Timestep do

  before(:each) do
    @attr = {
      :stepnumber => "1",
    }
  end

  it "should create a new instance given valid attributes" do
    Timestep.create!(@attr)
  end

  it "should require a timestep" do
    no_timestep = Timestep.new(@attr.merge(:stepnumber => ""))
    no_timestep.should_not be_valid
  end

  it "should reject strings as input" do
    string = "a"
    string = Timestep.new(@attr.merge(:stepnumber => string))
    string.should_not be_valid
  end

  it "should reject floats as input" do
    float = "3.4"
    float = Timestep.new(@attr.merge(:stepnumber => float))
    float.should_not be_valid
  end

  it "should accept integers as input" do
    integer = "3"
    integer = Timestep.new(@attr.merge(:stepnumber => integer))
    integer.should be_valid
  end

  it "should reject duplicate timesteps" do
    Timestep.create!(@attr)
    duplicate_timestep = Timestep.new(@attr)
    duplicate_timestep.should_not be_valid
  end

end

