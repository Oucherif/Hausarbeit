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

require 'spec_helper'

describe Solseg do
  pending "add some examples to (or delete) #{__FILE__}"
end
