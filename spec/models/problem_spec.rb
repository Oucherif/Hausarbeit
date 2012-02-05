# == Schema Information
#
# Table name: problems
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Problem do

  before(:each) do
    @attr = {
      :user_id => "1",
    }
    @user=Factory(:user)                                #User mit ID 1 erzeugen
  end

  it "should create a new instance given valid attributes" do
    Problem.create!(@attr)
  end

  it "should require a user_id" do
    no_user_id = Problem.new(@attr.merge(:user_id => ""))
    no_user_id.should_not be_valid
  end

  it "should reject user_ids that do not exist" do
    wrong_user_id = "9"*51
    wrong_user_id = Problem.new(@attr.merge(:user_id => wrong_user_id))
    wrong_user_id.should_not be_valid
  end
end

