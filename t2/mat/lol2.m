graphics_toolkit('gnuplot')

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

f=1000

vs= @(t) sin(2*pi*f*t)
vs=e^(i*(pi/2)) %cos(2pift+pi/2) sem a parte do 2pift

Zc=i*2*pi*f*C
inZc=1/Zc

A=[1     , 0               , 0    , 0           , 0         , 0          , 0     ;
   1/R1  , -1/R1-1/R2-1/R3 , 1/R2 , 1/R3        , 0         , 0          , 0     ;
   0     , 0               , 0    , 0           , 0         , -1/R6-1/R7 , 1/R7  ;
   0     , 0               , 0    , 1           , 0         , Kd/R6      , -1    ;
   0     , Kb              , 0    , -1/R5-Kb    , 1/R5+inZc , 0          , -inZc ;
   0     , -1/R2-Kb        , 1/R2 , Kb          , 0         , 0          , 0     ;
   -1/R1 , 1/R1            , 0    , 1/R4        , 0         , 1/R6       , 0     ]
   
   
   y=[vs ; 0 ; 0 ; 0 ; 0 ; 0 ; 0]

res=y'/A'

t=0.01;
f=20*logspace(0.1,1e6,1e4);
func3= (real(e.^(2.*pi.*i.*t.*f).*res(5)));
func4= (real(e.^(2.*pi.*i.*t.*f).*(res(5)-res(7)))); 
func5= (real(e.^(2.*pi.*i.*t.*f).*(vs)));
hold on;
figura = figure();
plot ( f , func3, f, func4, f , func5);

xlabel ("f");
ylabel ("func4");
title ("teste da coisa");

print (figura, "yyyjyy", "-dsvg"); 