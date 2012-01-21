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

end
