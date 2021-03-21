R1 = 1.02166163214; 
R2 = 2.05713464724;
R3 = 3.1028870108 ;
R4 = 4.16870321182 ;
R5 = 3.01167607597 ;
R6 = 2.04520070018 ;
R7 = 1.02576029486 ;
Va = 5.248410807 ;
Id = 1.00334118042 ;
Kb = 7.24529394385 ;
Kc = 8.2920273339 ;

A=[1     , 0               , 0    , 0           , 0    , 0          , 0    ;
   1/R1  , -1/R1-1/R2-1/R3 , 1/R2 , 1/R3        , 0    , 0          , 0    ;
   0     , 0               , 0    , 0           , 0    , -1/R6-1/R7 , 1/R7 ;
   0     , 0               , 0    , 1           , 0    , Kc/R6      , -1   ;
   0     , Kb/R3           , 0    , -1/R5-Kb/R3 , 1/R5 , 0          , 0    ;
   0     , -1/R2-Kb/R3     , 1/R2 , Kb/R3       , 0    , 0          , 0    ;
   -1/R1 , 1/R1            , 0    , 1/R4        , 0    , 1/R6       , 0    ]
   
y=[Va ; 0 ; 0 ; 0 ; Id ; 0 ; 0]

res=y'/A'

fprintf ( fopen("nodal.tex", "w") , '\\[[\\;%g\\;%g\\;%g\\;%g\\;%g\\;%g\\;%g\\;]\\]' , res(1) , res(2) , res(3) , res(4) , res(5) , res(6) , res(7) )
printf ("\nSuccess!\n")
