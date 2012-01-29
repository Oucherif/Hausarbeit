# == Schema Information
#
# Table name: demands
#
#  id          :integer         not null, primary key
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
  validates :timestep_id,     :presence   => true
  validates :demandvalue,     :presence   => true
  attr_accessible :product_id, :timestep_id, :demandvalue

end
