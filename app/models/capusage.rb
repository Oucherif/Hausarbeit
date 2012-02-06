# == Schema Information
#
# Table name: capusages
#
#  id            :integer         not null, primary key
#  problem_id    :integer
#  product_id    :integer
#  segment_id    :integer
#  preperiod_id  :integer
#  capusagevalue :float
#  created_at    :datetime
#  updated_at    :datetime
#

class Capusage < ActiveRecord::Base

  belongs_to :product
  belongs_to :segment
  belongs_to :preperiod
  validates :product_id,     :presence   => true
  validate :product_id_exists
    def product_id_exists
     if Product.find_by_id(product_id)==nil
       errors.add(:base, "Produkt muss definiert sein")
     end
    end

  validates :segment_id,     :presence   => true
  validate :segment_id_exists
    def segment_id_exists
     if Segment.find_by_id(segment_id)==nil
       errors.add(:base, "Segment muss definiert sein")
     end
    end

  validates :preperiod_id,     :presence   => true
    validate :preperiod_id_exists
    def preperiod_id_exists
     if Preperiod.find_by_id(preperiod_id)==nil
       errors.add(:base, "Vorlaufperiode muss definiert sein")
     end
    end

  validates :capusagevalue,     :presence   => true
  validates_numericality_of :capusagevalue
  attr_accessible :product_id, :segment_id, :preperiod_id, :capusagevalue
end
