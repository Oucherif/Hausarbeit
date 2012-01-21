*Transportmodell_v1_Input_Instanz1.inc
*Autor: Farid Oucherif
*Stand: 20.12.2011

set i    /i1*i3/
    j    /j1*j4/
    k    /k1*k4/;

Parameter Zmax(k)
         / k1 2
           k2 4
           k3 0/

set    z    /z0*z(Zmax(k))/;

Table b(j,t)
                 j1     j2      j3     j4
         t1      6      2       6      7
         t2      4      9       5      3
         t3      8      8       1      6
         ;

Table d(k,t)
                 k1     k2      k3     k4
         t1      6      2       6      7
         t2      4      9       5      3
         t3      8      8       1      6
         ;

Table Umax(j,t)
                 j1     j2      j3     j4
         t1      6      2       6      7
         t2      4      9       5      3
         t3      8      8       1      6
         ;

Table f(1,k,z)
                 k1     k2      k3     k4
         z1      6      2       6      7
         z2      4      9       5      3
         z3      8      8       1      6
         ;

Table f(2,k,z)
                 k1     k2      k3     k4
         z1      6      2       6      7
         z2      4      9       5      3
         z3      8      8       1      6
         ;

Table f(3,k,z)
                 k1     k2      k3     k4
         z1      6      2       6      7
         z2      4      9       5      3
         z3      8      8       1      6
         ;

Table f(4,k,z)
                 k1     k2      k3     k4
         z1      6      2       6      7
         z2      4      9       5      3
         z3      8      8       1      6
         ;

Parameter h(k)
         / k1  20,
           k2  25,
           k3  21/

          u(t)
         / t1 15
           t2 17
           t3 22
           t4 12/

          y(k,0)
         / k1 20
           k2 25
           k3 21/
