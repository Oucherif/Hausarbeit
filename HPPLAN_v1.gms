* HPPLAN
* Autor: Farid Oucherif
* Stand: 20.12.2011


set      j            Produktionssegmente
         k            Produkte
         t            Länge des Planungszeitraums in Perioden
         z            Anzahl der Vorlaufperioden für betrachtetes Produkt;

parameter
         b(j,t)       Produktionskapazität von Produktionssegment j in Periode t
         d(k,t)       Nachfrage für Produkt k in Periode t
         f(j,k,z)     durch Produkt k verursachte Kapazitätsbelastung von Produktionssegment j in der Vorlaufperiode z
         h(k)         Lagerkostensatz für Produkt k pro Mengeneinheit und Periode
         Umax(j,t)    maximale Zusatzkapazität in Produktionssegment j in Periode t
         u(t)         Kosten für eine Einheit der Zusatzkapazität in Periode t
         Zmax(k)      Anzahl der Vorlaufperioden für Produkt k
         y0(k)        Lageranfangsbestand von Produkt k
         i(z)         Zahl der Vorlaufperiode;

$include HPPLAN_v1_Input_Instanz1.inc

variables ZF Zielfunktionswert;
positive variables       UV(j,t) genutzte Zusatzkapazität in Produktionssegment j in Periode t
                         x(k,t) Produktionsmenge von Produkt k in Periode t
                         y(k,t) Lagerbestand für Produkt k am Ende von Periode t;

Equations
Zielfunktion Minimierung der Lagerkosten und Kosten für Zusatzkapazitäten
Lagerbedingung(k,t) Produktionsmenge und Lagerbestand müssen gleich dem neuen Lagerbestand und der Nachfrage sein
Kapazitaetsbelastung(j,t) Die genutzte Kapazität darf die maximale nur um Zusatzkapazität überschreiten
maximale_Zusatzkapazitaet(j,t) Die Zusatzkapazität darf die maximale Zusatzkapazität nicht überschreiten;

Zielfunktion..
         ZF =e=  sum((k,t),h(k)*y(k,t))+sum((t,j),u(t)*UV(j,t));

Lagerbedingung(k,t)..
         y0(k)$(ord(t)=1)+x(k,t)+y(k,t-1)$(ord(t)>1)-y(k,t) =e= d(k,t);

Kapazitaetsbelastung(j,t)..
         sum((k,z),f(j,k,z)*x(k,t+i(z)))-UV(j,t) =l= b(j,t);

maximale_Zusatzkapazitaet(j,t)..
         UV(j,t) =l= Umax(j,t);

model HPPLANv1 /
                 Zielfunktion
                 , Lagerbedingung
                 , Kapazitaetsbelastung
                 , maximale_Zusatzkapazitaet
                 /;



display b, d, f, h, u, Umax;

solve HPPLANv1 minimizing ZF using lp;

display x.l;

file outputfile / 'HPPLAN_v1_Solution.txt'/;
put outputfile;

put 'Objective Function Value: ', ZF.l/

put /

loop(k,
    loop(t,
        put k.tl:0, ' ; ' t.tl:0 ' ; ' x.l(k,t) /
        );
    );

put /

loop(k,
    loop(t,
        put k.tl:0, ' ; ' t.tl:0 ' ; ' y.l(k,t) /
        );
    );

put /

loop(j,
    loop(t,
        put j.tl:0, ' ; ' t.tl:0 ' ; ' UV.l(j,t) /
        );
    );
