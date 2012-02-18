# == Schema Information
#
# Table name: addcapcosts
#
#  id              :integer         not null, primary key
#  problem_id      :integer
#  timestep_id     :integer
#  addcapcostvalue :float
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Addcapcost do

  before(:each) do
    @attr = {
      :timestep_id => "1",
      :addcapcostvalue => "0",
      :problem_id => "1"}
    @user=Factory(:user)                                      #User erzeugen
    @problem=Factory(:problem)                                #Problem erzeugen
    @timestep=Factory(:timestep)                              #Timestep mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Addcapcost.create!(@attr)
  end

  it "should require a timestep_id" do
    no_timestep_id = Addcapcost.new(@attr.merge(:timestep_id => ""))
    no_timestep_id.should_not be_valid
  end

  it "should require a addcapcostvalue" do
    no_addcapcostvalue = Addcapcost.new(@attr.merge(:addcapcostvalue => ""))
    no_addcapcostvalue.should_not be_valid
  end

  it "should reject timestep_ids that do not exist" do
    wrong_timestep_id = "9"*51
    wrong_timestep_id = Addcapcost.new(@attr.merge(:timestep_id => wrong_timestep_id))
    wrong_timestep_id.should_not be_valid
  end

  it "should reject strings as input for addcapcostvalue" do
    string = "a"
    string = Addcapcost.new(@attr.merge(:addcapcostvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for addcapcostvalue" do
    float = "3.4"
    float = Addcapcost.new(@attr.merge(:addcapcostvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for addcapcostvalue" do
    integer = "3"
    integer = Addcapcost.new(@attr.merge(:addcapcostvalue => integer))
    integer.should be_valid
  end

end
