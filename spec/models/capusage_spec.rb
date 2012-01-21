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

require 'spec_helper'

describe Capusage do
  pending "add some examples to (or delete) #{__FILE__}"
end
