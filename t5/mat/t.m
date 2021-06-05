function retval = t (s,C1,C2,R1,R2,R3,R4)

  retval = (R1*C1*s/(1+R1*C1*s)) * (1+R3/R4) * 1/(1+R2*C2*s) ;
  
endfunction
