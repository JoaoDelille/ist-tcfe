function retval = leinonat (Rpar,C,t,Vm3,Vs,t0n)
  Vn=Vm3*e^(-(t-t0n)/(Rpar*C));
  retval=Vn;
endfunction
