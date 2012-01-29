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
  validates :segment_id,     :presence   => true
  validates :timestep_id,     :presence   => true
  validates :prodcapvalue,     :presence   => true
  attr_accessible :segment_id, :timestep_id, :prodcapvalue

end
