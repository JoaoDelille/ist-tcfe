
R1 =  ; 
R2 =  ;
R3 =  ;
R4 =  ;
R5 =  ;
R6 =  ;
R7 =  ;


%A=[ R1+R3+R4 , R3       , R4           , 0 ;
%    Kb*R3    , Kb*R3-1  , 0            , 0 ;
%    R4       , 0        , R4+R6+R7-Kc  , 0 ;
%    0        , 0        , 0            , 1 ]

%y=[Va, 0, 0, Id]
%res=y/A'

%fprintf( fopen( "mesh.tex" , "w" ) , 'm\\_1  & m\\_2  & m\\_3  & m\\_4 \\\\ %g mA & %g mA & %g mA & %gA\\\\' , res(1) , res(2) , res(3) , res(4) )
%printf( " \nSuccess! \n" ) 
