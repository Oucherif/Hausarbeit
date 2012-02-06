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

class Addcapcost < ActiveRecord::Base

  belongs_to :timestep
  validates :timestep_id,     :presence   => true
  validates :addcapcostvalue, :presence   => true
  validates_numericality_of :addcapcostvalue

  validate :timestep_id_exists
    def timestep_id_exists
     if Timestep.find_by_id(timestep_id)==nil
       errors.add(:base, "Zeitpunkt muss definiert sein")
     end
    end
  attr_accessible :timestep_id, :addcapcostvalue
end
