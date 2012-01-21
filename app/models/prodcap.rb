# == Schema Information
#
# Table name: prodcaps
#
#  id           :integer         not null, primary key
#  segment_id   :integer
#  timestep_id  :integer
#  prodcapvalue :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Prodcap < ActiveRecord::Base

  belongs_to :segment
  belongs_to :timestep

end
