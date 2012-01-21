# == Schema Information
#
# Table name: timesteps
#
#  id         :integer         not null, primary key
#  stepnumber :integer
#  created_at :datetime
#  updated_at :datetime
#

class Timestep < ActiveRecord::Base

  has_many :prodcaps, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  has_many :addcapcosts, :dependent => :destroy

end
