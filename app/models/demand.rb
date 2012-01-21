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

end
