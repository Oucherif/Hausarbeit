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

end
