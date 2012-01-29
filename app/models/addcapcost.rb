# == Schema Information
#
# Table name: addcapcosts
#
#  id              :integer         not null, primary key
#  timestep_id     :integer
#  addcapcostvalue :float
#  created_at      :datetime
#  updated_at      :datetime
#

class Addcapcost < ActiveRecord::Base

  belongs_to :timestep
  validates :timestep_id,     :presence   => true
  validates :addcapcostvalue, :presence   => true
  attr_accessible :timestep_id, :addcapcostvalue
end
