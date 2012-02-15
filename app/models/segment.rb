# == Schema Information
#
# Table name: segments
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  segmentname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Segment < ActiveRecord::Base
  belongs_to :problem
  has_many :prodcaps, :dependent => :destroy
  has_many :capusages, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  validates :segmentname,     :presence   => true
  validates_uniqueness_of :segmentname, :scope => :problem_id
  attr_accessible :segmentname

end
