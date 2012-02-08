* HPPLAN_v1
* Autor: Farid Oucherif
* Stand: 03.02.2011


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
         x(k,t)+y0(k)$(ord(t)=1)+y(k,t-1)$(ord(t)>1)-y(k,t) =e= d(k,t);

Kapazitaetsbelastung(j,t)..
         sum((k,z),f(j,k,z)*x(k,t+i(z)))-UV(j,t) =l= b(j,t);

maximale_Zusatzkapazitaet(j,t)..
         UV(j,t) =l= Umax(j,t);

* Zusatzbedingung dass die Produkte anfangs je nach Vorperiodenanzahl noch nicht gefertigt werden koennen
$include HPPLAN_v1_Input_Zusatzbedingung.inc

model HPPLANv1 /
                 Zielfunktion
                 , Lagerbedingung
                 , Kapazitaetsbelastung
                 , maximale_Zusatzkapazitaet
                 /;



display b, d, f, h, u, Umax, y0, i;

solve HPPLANv1 minimizing ZF using lp;

display x.l;

file outputfile1 / 'HPPLAN_v1_Solution_Prod.txt'/;
put outputfile1;


loop(k,
    loop(t,
        put k.tl:0, ' ; ' t.tl:0 ' ; ' x.l(k,t) ' ; ' y.l(k,t) /
        );
    );

file outputfile2 / 'HPPLAN_v1_Solution_Segm.txt'/;
put outputfile2;

loop(j,
    loop(t,
        put j.tl:0, ' ; ' t.tl:0 ' ; ' UV.l(j,t) /
        );
    );

file outputfile3 / 'HPPLAN_v1_OFV.txt'/;
put outputfile3;

put 'Zielfunktionswert: ', ZF.l/

put /
