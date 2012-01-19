class Word < String
  def allcapitals?
     self == self.upcase
  end
end

w=Word.new("Stefan")

puts w.allcapitals?

w=Word.new("ANDREAS")

puts w.allcapitals?

