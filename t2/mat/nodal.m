R1 = 1.02166163214 
R2 = 2.05713464724 
R3 = 3.10288701080 
R4 = 4.16870321182 
R5 = 3.01167607597 
R6 = 2.04520070018 
R7 = 1.02576029486 
Vs = 5.24841080700 
C  = 1.00334118042 
Kb = 7.24529394385 
Kd = 8.29202733390 

Id=0

%   V1     V2                  V3       V5          V6        V7       V8
A=[1     , 0               , 0    , 0           , 0    , 0          , 0    ;
   1/R1  , -1/R1-1/R2-1/R3 , 1/R2 , 1/R3        , 0    , 0          , 0    ;
   0     , 0               , 0    , 0           , 0    , -1/R6-1/R7 , 1/R7 ;
   0     , 0               , 0    , 1           , 0    , Kd/R6      , -1   ;
   0     , Kb              , 0    , -1/R5-Kb    , 1/R5 , 0          , 0    ;
   0     , -1/R2-Kb        , 1/R2 , Kb          , 0    , 0          , 0    ;
   -1/R1 , 1/R1            , 0    , 1/R4        , 0    , 1/R6       , 0    ]

y=[Vs ; 0 ; 0 ; 0 ; Id ; 0 ; 0]

res=y'/A'

fprintf ( fopen("nodeVolt.tex", "w") , '\n V(1) & V(2) & V(3) & V(5) & V(6) & V(7) & V(8) \\\\ \n %g V   & %g V  & %g V  & %g V  & %g V  & %g V  & %g V\\\\\n' , res(1) , res(2) , res(3) , res(4) , res(5) , res(6) , res(7) )
printf ("\nSuccess!\n")

corr=[(res(2)-res(1))/R1 , (res(3)-res(2))/R2 , (res(2)-res(4))/R3 , res(4)/R4 , (res(5)-res(4))/R5 , res(6)/R6 , (res(7)-res(6))/R7 ] 

fprintf ( fopen("nodeCurr.tex", "w") , '\n I(1) & I(2) & I(3) & I(5) & I(6) & I(7) & I(8) \\\\ \n %g A   & %g A  & %g A  & %g A  & %g A  & %g A  & %g A\\\\\n' , corr(1) , corr(2) , corr(3) , corr(4) , corr(5) , corr(6) , corr(7) )
printf ("\nSuccess!\n")
