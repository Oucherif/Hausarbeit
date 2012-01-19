def string_message(string)
  if string.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

# puts string_message("")
# puts string_message("Hallo Welt! (Deutsch fuer 'Hello World!')")


def summe(a, b)
  return a+b
end

# puts summe(1, 31)

def fakultaet2(n)
  x=1
  for i in 1..n
    x=x*i
  end
  return x
end


def fakultaet1(n)
#  x=n
#  puts ""
#  puts "Vorher " + x.to_s
  if n>1
    x=n*fakultaet1(n-1)
  else
    x=1
  end
#  puts "Nachher " + x.to_s
  return x

end


def fakultaet3(n)
  i=1
  x=1
  while !(i>n)
    x=x*i
    i=i+1
  end
  return x
end

def fakultaet4(n)
  x=1
  (1..n).each{|i|
     x=x*i
  }
  return x
end

# puts fakultaet1(4)
# puts fakultaet3(4)


#(1..5).each {|k| puts k+1000}

# eindimensionales Feld anlegen

a=Array.new(4)
b=Array.new(5)
c=Array.new(4){ Array.new(5)}

a[0]="Ist mir egal, nehme ich ohnehin nicht"
a[1]=10
a[2]=8

b=[0, 6, 5, 8, 6]

c=[ [0, 0, 0, 0, 0],
    [0, 7, 2, 4, 7],
    [0, 9, 5, 3, 3],
    [0, 7, 7, 6, 4]]

1.upto(3){|i|
  1.upto(4){|j|
      print c[i][j], "  "
  }
  print "\n"
}


