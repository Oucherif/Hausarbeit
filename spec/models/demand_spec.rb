# == Schema Information
#
# Table name: demands
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  product_id  :integer
#  timestep_id :integer
#  demandvalue :float
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Demand do

  before(:each) do
    @attr = {
      :product_id => "1",
      :timestep_id => "1",
      :demandvalue => "0"}
    @product=Factory(:product)                                #Product mit ID 1 erzeugen
    @timestep=Factory(:timestep)                              #Timestep mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Demand.create!(@attr)
  end

  it "should require a product_id" do
    no_product_id = Demand.new(@attr.merge(:product_id => ""))
    no_product_id.should_not be_valid
  end

  it "should require a timestep_id" do
    no_timestep_id = Demand.new(@attr.merge(:timestep_id => ""))
    no_timestep_id.should_not be_valid
  end

  it "should require a demandvalue" do
    no_demandvalue = Demand.new(@attr.merge(:demandvalue => ""))
    no_demandvalue.should_not be_valid
  end

  it "should reject product_ids that do not exist" do
    wrong_product_id = "9"*51
    wrong_product_id = Demand.new(@attr.merge(:product_id => wrong_product_id))
    wrong_product_id.should_not be_valid
  end

  it "should reject timestep_ids that do not exist" do
    wrong_timestep_id = "9"*51
    wrong_timestep_id = Demand.new(@attr.merge(:timestep_id => wrong_timestep_id))
    wrong_timestep_id.should_not be_valid
  end

  it "should reject strings as input for demandvalue" do
    string = "a"
    string = Demand.new(@attr.merge(:demandvalue => string))
    string.should_not be_valid
  end

  it "should accept floats as input for demandvalue" do
    float = "3.4"
    float = Demand.new(@attr.merge(:demandvalue => float))
    float.should be_valid
  end

  it "should accept integers as input for demandvalue" do
    integer = "3"
    integer = Demand.new(@attr.merge(:demandvalue => integer))
    integer.should be_valid
  end

end

