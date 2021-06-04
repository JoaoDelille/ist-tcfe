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
  tplot(n)=t(s,C1,C2,R1,R2,R3,R4);
  Vout(n)=tplot(n)*Vi;
  if(k>1 && Vout(n)>Vout(n-1))
    Vmax=Vout(n);
  endif
  Zi(n)=R1+1/(i*2*pi*f(n)*C1);
  Zo(n)=(1/R2+i*2*pi*f(n)*C2)^-1;
  n++;
  
endfor
Vmax
Zi_100=R1+1/(i*2*pi*100*C1)
Zo_100=(1/R2+i*2*pi*100*C2)^-1

plot(log10(f), 20*log10(Vout) , ".");
title ("Gain função da fequência");
ylabel ("dB");
xlabel ("log(Hz)");
print("amp", "-dpng");

plot(log10(f*2*pi), 20*log10(tplot) , ".");
title ("T(s)");
ylabel ("dB");
xlabel ("log(Re(s)");
print("T(s)", "-dpng");

plot(log10(f*2*pi), 20*log10(Zi) , ".");
title ("Zi");
ylabel ("dB");
xlabel ("log(Re(s)");
print("Zi", "-dpng");

plot(log10(f*2*pi), 20*log10(Zo) , ".");
title ("Zo");
ylabel ("dB");
xlabel ("log(Re(s)");
print("Zo", "-dpng");