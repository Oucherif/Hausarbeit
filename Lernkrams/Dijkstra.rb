def dijkstra

  infinity= 1.0/0
  a=infinity

  d=Array.new(5)
  c=Array.new(5) { Array.new(5) }
  m=Array.new(5)
  n=Array.new(5)
  r=Array.new(5)
  z=Array.new(5)

  c=[[a, 20, a, 10, a],
     [a, a, 20, a, 50],
     [a, a, a, a, 10],
     [a, 20, a, a, 50],
     [a, a, 20, a, a]]

  0.upto(4) do |i|
    0.upto(4) do |j|
      print c[i][j], "  "
    end
    print "\n"
  end
  print "\n"


  d=[0, a, a, a, a]
  m=[0]
  r=[]
  z=[]
  n=[]

  while m!=[]                                                          # Solange Menge markierter Knoten nicht gleich 0
    z=[]                                                               # Entfernungsarray zurücksetzen
    for i in m                                                         # In allen Knoten aus der Menge der markierten Knoten
      z << d[i]                                                        # Array z erstellen und Distanzen iterativ einfügen
    end
    i=0                                                                # i zurücksetzen damit anschließend hochzählen reicht
    while d[i]!=z.min                                                  # Wenn die Distanz des Knotens i nicht der minimalen Distanz der markierten Knoten entspricht
      i=i+1                                                            # dann einen Knoten weiterzählen
    end
    for j in 0..4
      if c[i][j]!=a                                                    # Wenn eine direkte Verbindung existiert und
        if d[j]>d[i]+c[i][j]                                           # Wenn Entfernung des Nachfolgeknotens größer als über aktuellen Knoten
          d[j]=d[i]+c[i][j]                                            # Dann Entfernung über aktuellen Knoten als neue kürzeste Entfernung setzen
          r[j]=i                                                       # Aktuellen Knoten als Vorgängerknoten angeben
          if n.index(j)                                                # wenn j schon in n ist
                                                                       # nichts tun
          else
            m << j                                                     # Sonst nimm den Nachfolgerknoten in markierte Knoten auf
            n << j                                                     # und mache Markierung im Tabu-Array
          end
        else
          if n.index (j)                                               # wenn j schon in n ist
                                                                       # nichts tun
          else
             m << j                                                    # Sonst nimm den Nachfolgerknoten in markierte Knoten auf
            n << j                                                     # und mache Markierung im Tabu-Array
          end

        end
      else                                                             # Sonst passiert nichts
      end
    end
    m.delete(i)                                                        # Untersuchten Knoten aus markierten Knoten entfernen
    m.uniq!                                                            # Doppelt markierte Knoten entfernen
  end
  print "r="
  print r                                                              # Vorgänger ausgeben
  print "\n"
  print "d="
  print d                                                              # Entfernungen ausgeben
  print "\n"
end

puts dijkstra                                                          # freuen das es geklappt hat!