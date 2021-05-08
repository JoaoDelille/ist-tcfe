function retval = leinosforc (Vs,Vd,r,C,Z_C,Rpar)

  x=[ 1 ,   0  ,            0           ;
      0 ,   1  ,            0           ;
      0 , -1/r , (1/r)+(1/Z_C)+(1/Rpar) ]

  y=[ Vs , Vs-Vd , 0 ]

  retval=y/x';
endfunction

