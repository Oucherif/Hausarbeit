Factory.define :user do |user|
  user.name                  "Farid"
  user.email                 "f@o.de"
  user.password              "123456"
  user.password_confirmation "123456"
end

Factory.define :timestep do |timestep|
  timestep.id                        "1"
  timestep.stepnumber                "1"
end

Factory.define :product do |product|
  product.id                           "1"
  product.productname                  "A"
end

Factory.define :segment do |segment|
  segment.id                           "1"
  segment.segmentname                  "1"
end


Factory.define :preperiod do |preperiod|
  preperiod.id                        "1"
  preperiod.product_id                "1"
  preperiod.preperiodnumber           "0"
end
