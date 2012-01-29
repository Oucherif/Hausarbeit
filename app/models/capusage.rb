# == Schema Information
#
# Table name: capusages
#
#  id            :integer         not null, primary key
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
  validates :segment_id,     :presence   => true
  validates :preperiod_id,     :presence   => true
  validates :capusagevalue,     :presence   => true
  attr_accessible :product_id, :segment_id, :preperiod_id, :capusagevalue
end
