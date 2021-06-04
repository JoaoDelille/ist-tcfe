C1=220*10^-9;
C2=220*10^-9;
R1=500
R2=1000
R3=300000
R4=10000
Vi=10
f=logspace(0,7,1000);
n=size(f)
k=1;
n=1;
Vmax=0;
for k = 1:numel(f)
  s=2*pi*f(n)*i;
  Vout(n)=t(s,C1,C2,R1,R2,R3,R4)*Vi;
  
  if(k>1 && Vout(n)>Vout(n-1))
    Vmax=Vout(n);
  endif
  
  n++;
endfor
Vmax
hold on
plot(log10(f), 20*log10(Vout) , ".");
title ("Gain função da fequência");
ylabel ("dB");
xlabel ("log(Hz)");
print("amp", "-dpng");