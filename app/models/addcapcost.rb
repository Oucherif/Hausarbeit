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
  belongs_to :problem
  belongs_to :timestep

  validates :timestep_id,     :presence   => true
  validates :addcapcostvalue, :presence   => true
  validates_numericality_of :addcapcostvalue

  validates :problem_id, :presence => true
  validate :problem_id_exists
    def problem_id_exists
      if Problem.find_by_id(problem_id)==nil
        errors.add(:base, "Problem muss definiert sein")
      end
    end

  validate :timestep_id_exists
    def timestep_id_exists
     if Timestep.find_by_id(timestep_id)==nil
       errors.add(:base, "Zeitpunkt muss definiert sein")
     end
    end
  attr_accessible :timestep_id, :addcapcostvalue, :problem_id
end
