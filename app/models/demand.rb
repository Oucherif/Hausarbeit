# == Schema Information
#
# Table name: demands
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  product_id  :integer
#  timestep_id :integer
#  demandvalue :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Demand < ActiveRecord::Base

  belongs_to :product
  belongs_to :timestep
  validates :product_id,     :presence   => true

  validate :product_id_exists
    def product_id_exists
     if Product.find_by_id(product_id)==nil
       errors.add(:base, "Produkt muss definiert sein")
     end
    end

  validates :timestep_id,     :presence   => true
  validate :timestep_id_exists
    def timestep_id_exists
     if Timestep.find_by_id(timestep_id)==nil
       errors.add(:base, "Zeitpunkt muss definiert sein")
     end
    end

  validates :demandvalue,     :presence   => true
  validates_numericality_of :demandvalue
  attr_accessible :product_id, :timestep_id, :demandvalue

end
