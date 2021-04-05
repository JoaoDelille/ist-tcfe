dados=fopen("./data.txt",'r');
array = fscanf(dados,'R1 = %e \nR2 = %e\nR3 = %e \nR4 = %e \nR5 = %e \nR6 = %e \nR7 = %e \nVs = %e \nC = %e \nKb = %e \nKd = %e');
fclose(dados)

R1 = array(1)
R2 = array(2)
R3 = array(3)
R4 = array(4)
R5 = array(5)
R6 = array(6)
R7 = array(7)
Vs = array(8)
C  = array(9)
Kb = array(10)
Kd = array(11)

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


V8=res(7)
V6=res(5)
 
 
   %     V2              V3        V5     V6     V7         V8
A=[  1/R1           , 0       , 1/R4    , 0 , 1/R6       , 0     ;
    -1/R2-Kb        , 1/R2    , Kb      , 0 , 0          , 0     ;
     1/R1+1/R2+1/R3 , -1/R2   , -1/R3   , 0 , 0          , 0     ;
     0              , 0       , 0       , 0 , 1/R6+1/R7  , -1/R7 ;
     0              , 0       , 0       , 1 , 0          , -1    ;
     0              , 0       , 1       , 0 , Kd/R6      , -1    ]

y=[0, 0, 0, 0,V6-V8,0]
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

fprintf ( fopen("phasor.tex", "w") , '\n V(1) & V(2) & V(3) & V(4) & V(5) & V(6) & V(7) \\\\ \n %g V   & %g%+gi V  & %g%+gi V  & %g%+gi V  & %g%+gi V  & %g%+gi V  & %g%+gi V\\\\\n' , real(res(1)) , imag(res(1)) , real(res(2)) , imag(res(2)) , real(res(3)) , imag(res(3)) , real(res(4)) , imag(res(4)) , real(res(5)) , imag(res(5)) , real(res(6)) , imag(res(6)) , real(res(7)) , imag(res(7)) )

t=0:0.00001:0.02;
func= real(e.^(2.*pi.*i.*t.*f).*res(5));
hold on;
figura = figure();
plot ( t , func );

xlabel ("t");
ylabel ("V6");
title ("V6 forced response");

print (figura, "forcado", "-dsvg");





func2= (V6-V8)*e.^(-t/(timecte.*10.^-3));
hold on;
figura = figure();
plot ( t , func2 );

xlabel ("t");
ylabel ("V6");
title ("V6 natural response");

print (figura, "natural", "-dsvg"); 




func3= real(e.^(2.*pi.*i.*t.*f).*res(5))+(V6-V8)*e.^(-t/(timecte.*10.^-3));
hold on;
figura = figure();
plot ( t , func3 );

xlabel ("t");
ylabel ("V6");
title ("V6 final response");

print (figura, "final", "-dsvg"); 








freqs = logspace(-1, 6, 200);
for c = 1:size(freqs,2)

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


endfor

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
