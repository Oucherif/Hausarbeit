# == Schema Information
#
# Table name: timesteps
#
#  id         :integer         not null, primary key
#  stepnumber :integer
#  created_at :datetime
#  updated_at :datetime
#

class Timestep < ActiveRecord::Base

  has_many :prodcaps, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  has_many :addcapcosts, :dependent => :destroy
  validates :stepnumber,     :presence   => true
  validates_numericality_of :stepnumber, :only_integer => true
  validates :stepnumber, :uniqueness => true
  attr_accessible :stepnumber

  before_save :pruefe

  def pruefe
    logger.info "Hier pruefen"
    false
  end

end
