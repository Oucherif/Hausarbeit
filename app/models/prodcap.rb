# == Schema Information
#
# Table name: prodcaps
#
#  id           :integer         not null, primary key
#  problem_id   :integer
#  segment_id   :integer
#  timestep_id  :integer
#  prodcapvalue :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Prodcap < ActiveRecord::Base
  belongs_to :problem
  belongs_to :segment
  belongs_to :timestep

  validates :segment_id,     :presence   => true
  validate :segment_id_exists
    def segment_id_exists
     if Segment.find_by_id(segment_id)==nil
       errors.add(:base, "Segment muss definiert sein")
     end
    end

  validates :timestep_id,     :presence   => true
  validate :timestep_id_exists
    def timestep_id_exists
     if Timestep.find_by_id(timestep_id)==nil
       errors.add(:base, "Zeitpunkt muss definiert sein")
     end
    end

  validates :prodcapvalue,     :presence   => true
  validates_numericality_of :prodcapvalue
  attr_accessible :segment_id, :timestep_id, :prodcapvalue

end
