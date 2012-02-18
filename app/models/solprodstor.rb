# == Schema Information
#
# Table name: solprodstors
#
#  id                 :integer         not null, primary key
#  problem_id         :integer
#  product_id         :integer
#  timestep_id        :integer
#  productionvalue    :float
#  storageamountvalue :float
#  created_at         :datetime
#  updated_at         :datetime
#

class Solprodstor < ActiveRecord::Base
  belongs_to :problem

    validates :problem_id, :presence => true
  validate :problem_id_exists
    def problem_id_exists
      if Problem.find_by_id(problem_id)==nil
        errors.add(:base, "Problem muss definiert sein")
      end
    end
end
