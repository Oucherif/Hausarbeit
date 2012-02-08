# == Schema Information
#
# Table name: solsegs
#
#  id               :integer         not null, primary key
#  problem_id       :integer
#  segment_id       :integer
#  timestep_id      :integer
#  addcapusagevalue :float
#  created_at       :datetime
#  updated_at       :datetime
#

class Solseg < ActiveRecord::Base
end
