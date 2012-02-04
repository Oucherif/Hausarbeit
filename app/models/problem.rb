# == Schema Information
#
# Table name: problems
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Problem < ActiveRecord::Base
end
