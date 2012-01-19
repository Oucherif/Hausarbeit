h1 = {:a => 100, :b => 200}
h2 = {:b => 254, :c => 300}

h3 = h1.merge(h2)

h4 =h1.merge(h2){|key, oldval, newval| newval==oldval}

puts h1
puts h2
puts h3
puts h4


def string_shuffle(s)
  s.split('').shuffle.join
end

puts string_shuffle("foobar")


class String
   def shuffle
     self.split('').shuffle.join
   end
 end

puts "foobar".shuffle

person1 = { :first => "Stefan",:last => "Helber" }
person2 = { :first => "Maura",:last => "Monente-Helber" }
person3 = { :first => "Alexander",:last => "Helber" }
params = {:father => person1, :mother => person2, :child => person3}

puts params[:father][:last]