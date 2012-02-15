# == Schema Information
#
# Table name: timesteps
#
#  id         :integer         not null, primary key
#  problem_id :integer
#  stepnumber :integer
#  created_at :datetime
#  updated_at :datetime
#

class Timestep < ActiveRecord::Base
  belongs_to :problem
  has_many :prodcaps, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  has_many :addcapcosts, :dependent => :destroy
  validates :stepnumber,     :presence   => true
  validates_numericality_of :stepnumber, :only_integer => true
  validates_uniqueness_of :stepnumber, :scope => :problem_id
  attr_accessible :stepnumber

end
