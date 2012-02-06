# == Schema Information
#
# Table name: segments
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  segmentname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Segment do

  before(:each) do
    @attr = {
      :segmentname => "1",
    }
  end

  it "should create a new instance given valid attributes" do
    Segment.create!(@attr)
  end

  it "should require a segmentname" do
    no_segmentname = Segment.new(@attr.merge(:segmentname => ""))
    no_segmentname.should_not be_valid
  end

  it "should reject duplicate timesteps" do
    Segment.create!(@attr)
    duplicate_segment = Segment.new(@attr)
    duplicate_segment.should_not be_valid
  end

end
