# == Schema Information
#
# Table name: segments
#
#  id          :integer         not null, primary key
#  segmentname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Segment < ActiveRecord::Base

  has_many :prodcaps, :dependent => :destroy
  has_many :capusages, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  validates :segmentname,     :presence   => true
  validates :segmentname,     :uniqueness   => true
  attr_accessible :segmentname

end
