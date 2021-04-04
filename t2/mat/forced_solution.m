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

V8=-2.9614
V6=5.8022
   %     V2              V3        V5     V6     V7         V8
A=[  1/R1           , 0       , 1/R4    , 0 , 1/R6       , 0     ;
    -1/R2-Kb        , 1/R2    , Kb      , 0 , 0          , 0     ;
     1/R1+1/R2+1/R3 , -1/R2   , -1/R3   , 0 , 0          , 0     ;
     0              , 0       , 0       , 0 , 1/R6+1/R7  , -1/R7 ;
     0              , 0       , 0       , 1 , 0          , -1    ;
     0              , 0       , 1       , 0 , Kd/R6      , -1    ]

y=[0, 0, 0, 0,8.763595,0]
res=y/A'

Ix=-(V6-res(3))/R5-Kb*(res(1)-res(3))
Req=(V8-V6)/Ix
timecte=Req*C

fprintf ( fopen("condensador.tex", "w") , ' V(2) & V(3) & V(5) &  V(7) & Ix & Req & timecte\\\\ \n %g V  &  %g V   &  %g V  &  %g V  &  %g A  &  %g Ohm &  %g  s  \\\\\n' , res(1),res(2),res(3),res(4), Ix, Req, timecte')


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

fprintf ( fopen("phasor.tex", "w") , '\n V(1) & V(2) & V(3) & V(4) & V(5) & V(6) & V(7) \\\\ \n %g V   & %g V  & %g V  & %g V  & %g V  & %g V  & %g V\\\\\n' , res(1) , res(2) , res(3) , res(4) , res(5) , res(6) , res(7) )

t=0:0.00001:0.02;
func= real(e.^(2.*pi.*i.*t.*f).*res(5));
hold on;
figura = figure();
plot ( t , func );

xlabel ("t");
ylabel ("V6");
title ("V6 forced response");

print (figura, "forcado", "-dsvg");

func2= real(e.^(2.*pi.*i.*t.*f).*res(5))+8.7*e.^(-t/(timecte.*10.^-3));
hold on;
figura = figure();
plot ( t , func2 );

xlabel ("t");
ylabel ("V6");
title ("V6 final response");

print (figura, "final", "-dsvg"); 





%t=0.01;
%f=0.1:100:1000000;
%func3= 20*log10(abs(e.^(2.*pi.*i.*t.*f).*res(5)));
%func4= 20*log10(abs(e.^(2.*pi.*i.*t.*f).*(res(5)-res(7)))); 
%func5= 20*log10(abs(e.^(2.*pi.*i.*t.*f).*(vs)));
%hold on;
%figura = figure();
%plot ( f , func3, f, func4, f , func5);

%xlabel ("f");
%ylabel ("func4");
%title ("teste da coisa");

%print (figura, "yyyjyy", "-dsvg"); 

%t=0.01;
%f=logspace(0.1,1e6,1e4);
%func6= real(e.^(2.*pi.*i.*t.*f).*res(5))+8.7*e.^(-t/(4.5640*10^(-3))); 
%hold on;
%figura = figure(); 
%plot( f , func6); 

%xlabel ("f");
%ylabel ("func6");
%title ("teste da coisa");

%~print (figura, "abc", "-dsvg");
