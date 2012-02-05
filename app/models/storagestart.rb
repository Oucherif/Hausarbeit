# == Schema Information
#
# Table name: storagestarts
#
#  id                :integer         not null, primary key
#  product_id        :integer
#  storagestartvalue :float
#  created_at        :datetime
#  updated_at        :datetime
#

class Storagestart < ActiveRecord::Base

  belongs_to :product
  validates :product_id,            :presence   => true
  validates :storagestartvalue,     :presence   => true
  validates_numericality_of :storagestartvalue
  attr_accessible :product_id, :storagestartvalue
end
