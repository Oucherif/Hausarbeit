Factory.define :user do |user|
  user.id                    "1"
  user.name                  "Farid"
  user.email                 "f@oucherif.de"
  user.password              "123456"
  user.password_confirmation "123456"
end

Factory.define :timestep do |timestep|
  timestep.id                        "1"
  timestep.stepnumber                "1"
  timestep.problem_id                "1"
end

Factory.define :product do |product|
  product.id                           "1"
  product.productname                  "A"
  product.problem_id                   "1"
end

Factory.define :segment do |segment|
  segment.id                           "1"
  segment.segmentname                  "1"
  segment.problem_id                   "1"
end


Factory.define :preperiod do |preperiod|
  preperiod.id                        "1"
  preperiod.product_id                "1"
  preperiod.preperiodnumber           "0"
  preperiod.problem_id                "1"
end

Factory.define :solprodstor do |solprodstor|
  solprodstor.id                        "1"
  solprodstor.product_id                "1"
  solprodstor.timestep_id               "1"
  solprodstor.productionvalue           "0"
  solprodstor.storageamountvalue        "0"
  solprodstor.problem_id                "1"
end

Factory.define :problem do |problem|
  problem.id                           "1"
  problem.user_id                      "1"
  problem.problemname                  "test"
end