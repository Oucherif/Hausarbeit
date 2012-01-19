n=4

GZ= 1.0/0
c=[[0, 20, GZ, 10, GZ],
   [GZ, 0, 20, GZ, 50],
   [GZ, GZ, 0, GZ, 10],
   [GZ, 20, GZ, 0, 50],
   [GZ, GZ, 20, GZ, 0]]

vg=[[1, 1, 0, 1, 0],
    [0, 2, 2, 0, 2],
    [0, 0, 3, 0, 3],
    [0, 4, 0, 4, 4],
    [0, 0, 5, 0, 5]]

j=0
i=0
k=0

j.upto(4){|j|
  i.upto(4){|i|
    k.upto(4){|k|
      s=c[i][j]+c[j][k]
      if s<c[i][k]
        c[i][k]=s
        vg[i][k]=vg[j][k]
      end
    }
  }
}

puts "Vorgaengermatrix"
i.upto(4) {|i|
  k.upto(4) {|k|
   print vg[i][k], " "
  }
  print "\n"
}

print "\n"
puts "Entfernungsmatrix"
i.upto(4) {|i|
  k.upto(4) {|k|
   print c[i][k], " "
  }
  print "\n"
}

