def string_message(string)
      if string.empty?
        "It's an empty string!"
      else
        "The string is nonempty."
      end
end
puts string_message("")
puts string_message("Hallo Welt! (Deutsch fuer 'Hello World'")


def summe(a, b)
  a+b
end

#puts summe(1, 1)


def faculty(a)
  i=1
  b=i
  while i<= a
    b=b*i
    i=i+1
  end
  return b
end

#puts faculty(3)

def faculty_b(a)
  i=1
  b=a
  c=1
  while a-i>=0
    c=c*b
    b=(b-1)
    i=i+1
  end
  return c
end

#puts faculty_b(3)

(1..5).each {|i| puts i}

def faculty_c(n)
  x=1
  (1..n).each{|i|
    x=x*i
  }
  return x
end

puts faculty_c(4)