# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :timestep do |timestep|
  timestep.id                        "1"
  timestep.stepnumber                "1"
end

Factory.define :product do |product|
  product.id                           "1"
  product.productname                  "Auto"
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
