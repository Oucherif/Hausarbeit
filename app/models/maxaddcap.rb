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

class Maxaddcap < ActiveRecord::Base

  belongs_to :segment
  belongs_to :timestep
  validates :segment_id,     :presence   => true
  validates :timestep_id,     :presence   => true
  validates :maxaddcapvalue,     :presence   => true
  attr_accessible :segment_id, :timestep_id, :maxaddcapvalue

end
