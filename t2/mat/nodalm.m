R1 = ; 
R2 = ;
R3 = ;
R4 = ;
R5 = ;
R6 = ;
R7 = ;
Va = ;
Id = ;
Kb = ;
Kc = ;

%A=[1     , 0               , 0    , 0           , 0    , 0          , 0    ;
%   1/R1  , -1/R1-1/R2-1/R3 , 1/R2 , 1/R3        , 0    , 0          , 0    ;
%   0     , 0               , 0    , 0           , 0    , -1/R6-1/R7 , 1/R7 ;
%   0     , 0               , 0    , 1           , 0    , Kc/R6      , -1   ;
%   0     , Kb/R3           , 0    , -1/R5-Kb/R3 , 1/R5 , 0          , 0    ;
%   0     , -1/R2-Kb/R3     , 1/R2 , Kb/R3       , 0    , 0          , 0    ;
%   -1/R1 , 1/R1            , 0    , 1/R4        , 0    , 1/R6       , 0    ]
   
%y=[Va ; 0 ; 0 ; 0 ; Id ; 0 ; 0]

%res=y'/A'


%fprintf ( fopen("nodal.tex", "w") , '\n V(1) & V(2) & V(3) & V(4) & V(5) & V(6) & V(7) \\\\ \n %g V   & %g V  & %g V  & %g V  & %g V  & %g V  & %g V\\\\\n' , res(1) , res(2) , res(3) , res(4) , res(5) , res(6) , res(7) )
%printf ("\nSuccess!\n")

