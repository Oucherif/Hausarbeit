def nordwestecke

a=Array.new(4)
b=Array.new(5)
c=Array.new(4) { Array.new(5) }
x=Array.new(4) { Array.new(5) }

a=[0, 10, 8, 7]

b=[0, 6, 5, 8, 6]

c=[[0, 0, 0, 0, 0],
   [0, 7, 2, 4, 7],
   [0, 9, 5, 3, 3],
   [0, 7, 7, 6, 4]]


1.upto(3) do |i|
  1.upto(4) do |j|
    x[i][j]=[a[i], b[j]].min
    print "Neu zugewiesener Wert  "
    print x[i][j]
    print "\n"
    print "\n"

    a[i]=a[i]-x[i][j]
    print "Verbleibendes Angebot  "
    print a
    print "\n"
    print "\n"

    b[j]=b[j]-x[i][j]
    print "Verbleibende Nachfrage  "
    print b
    print "\n"
    print "\n"

    print "Zuweisungsmatrix  "
    print "\n"
    1.upto(3) do |i|
      1.upto(4) do |j|
        print x[i][j], "  "
      end
      print "\n"
    end
  end
  print "\n"
  print "\n"
end
end

print nordwestecke