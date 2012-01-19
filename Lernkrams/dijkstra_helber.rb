ANZORTE = 5
GZ=100000.0
ORTA=1
h=0

puts "Datenstrukturen"

#Kostenmatrix

c=Array.new(ANZORTE+1) { Array.new(ANZORTE+1) }

c=[[0, 0, 0, 0, 0, 0],
   [0, 0, 20, GZ, 10, GZ],
   [0, GZ, 0, 20, GZ, 50],
   [0, GZ, GZ, 0, GZ, 10],
   [0, GZ, 20, GZ, 0, 50],
   [0, GZ, GZ, 20, GZ, 0]]

puts "Ordentliche Ausgabe Kostenmatrix"
1.upto(5) { |i|
  1.upto(5) { |j|
    print c[i][j], " "
  }
  print "\n "
}

print "\n"


# Vorgängermatrix
vg=Array.new(ANZORTE+1) { Array.new(ANZORTE+1) }
vg=[[0, 0, 0, 0, 0, 0],
    [0, 1, 1, 0, 1, 0],
    [0, 0, 2, 2, 0, 2],
    [0, 0, 0, 3, 0, 3],
    [0, 0, 4, 0, 4, 4],
    [0, 0, 0, 5, 0, 5]]


# Datenstrukturen zur Lösung

D=Array.new(ANZORTE+1)
R=Array.new(ANZORTE+1)
MK=Array.new(ANZORTE+1)

# Initialisierung

1.upto(ANZORTE) { |i|
  if i==ORTA
    D[i]=0
    MK[i]=1 # Knoten markiert
  else
    D[i]=GZ
    MK[i]=0 # Knoten nicht markiert
  end

}

anz_mark_ort=1

# eigentlicher Programmablauf

while anz_mark_ort>0
# bislang kürzeste gefundene Distanz initialisieren
  dmin=GZ
  1.upto(ANZORTE) { |i|
    if MK[i]==1
      if D[i]<dmin
# neue kürzeste Distanz merken
        dmin=D[i]
# dazu passenden Knoten merken
        h=i
      end
    end
  } # nun sind h und D[h]=dmin bekannt
  1.upto(ANZORTE) { |j|
    if vg[h][j]>0
      if D[j]>D[h]+c[h][j]
        D[j]=D[h]+c[h][j]
        R[j]=h
        MK[j]=1
      end

    end
  }
  MK[h]=0


  anz_mark_ort=0
  1.upto(ANZORTE) { |i|
    if MK[i]==1
      anz_mark_ort=anz_mark_ort+1
    end
  }


end


puts "Ergebnis\n"

1.upto(ANZORTE) { |i|
  print "i= ", i, " R[i]= ", R[i], " D[i]=", D[i], "\n"
}

