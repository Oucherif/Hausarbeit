# == Schema Information
#
# Table name: preperiods
#
#  id              :integer         not null, primary key
#  problem_id      :integer
#  product_id      :integer
#  preperiodnumber :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Preperiod < ActiveRecord::Base


  belongs_to :problem
  belongs_to :product
  has_many :capusages, :dependent => :destroy


  validates :product_id,     :presence   => true

  validate :product_id_exists
    def product_id_exists
     if Product.find_by_id(product_id)==nil
       errors.add(:base, "Produkt muss definiert sein")
     end
    end

  validates :preperiodnumber,     :presence   => true
  validates_numericality_of :preperiodnumber, :only_integer => true
  attr_accessible :product_id, :preperiodnumber

end
