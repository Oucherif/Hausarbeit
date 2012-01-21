* HPPLAN
* Autor: Farid Oucherif
* Stand: 20.12.2011


set      j            Produktionssegmente
         k            Produkte
         t            Länge des Planungszeitraums in Perioden
         z            Anzahl der Vorlaufperioden für betrachtetes Produkt

parameter
         b(j,t)       Produktionskapazität von Produktionssegment j in Periode t
         d(k,t)       Nachfrage für Produkt k in Periode t
         f(j,k,z)     durch Produkt k verursachte Kapazitätsbelastung von Produktionssegment j in der Vorlaufperiode z
         h(k)         Lagerkostensatz für Produkt k pro Mengeneinheit und Periode
         Umax(j,t)    maximale Zusatzkapazität in Produktionssegment j in Periode t
         u(t)         Kosten für eine Einheit der Zusatzkapazität in Periode t
         Zmax(k)      Anzahl der Vorlaufperioden für Produkt k;

$include HPPLAN_v1_Input_Instanz1.inc

variables Z Zielfunktionswert;
positive variables       U(j,t) genutzte Zusatzkapazität in Produktionssegment j in Periode t
                         x(k,t) Produktionsmenge von Produkt k in Periode t
                         y(k,t) Lagerbestand für Produkt k am Ende von Periode t;

Equations
Zielfunktion Das ist die Zielfunktion
Lagerbedingung(k,t) Lagerinput und Lageroutput muss mit Nachfrage und Produktion zusammenpassen
Kapazitaetsbelastung(j,t) Die genutzte Kapazität darf die maximale nur um Zusatzkapazität überschreiten
maximale_Zusatzkapazitaet(j,t) Die Zusatzkapazität darf die maximale Zusatzkapazität nicht überschreiten;

Zielfunktion..
         Z =e=  sum((k,t),h(k)*y(k,t))+sum((t,j),u(t)*U(j,t));

Lagerbedingung(k,t)..
         x(k,t)+y(k,t-1)-y(k,t) =e= d(k,t);

Kapazitaetsbelastung(j,t)..
         sum((k,z),f(j,k,z)*x(k,t+z)-U(j,t)) =le= b(j,t);

maximale_Zusatzkapazitaet(j,t)..
         U(j,t) =le= Umax(j,t)

model HPPLANv1 /
                 Zielfunktion
                 , Lagerbedingung
                 , Kapazitaetsbelastung
                 , maximale_Zusatzkapazitaet
                 /;



display b, d, f, h, u, Umax;

solve HPPLANv1 minimizing Z using lp;

display x.l;
