C1=1*10^-6;
C2=1*10^-6;
R1=1000
R2=500
R3=100000+10000+10000
R4=1000
Vi=10

freqL=1/(C1*R1*2*pi)

freqH=1/(C2*R2*2*pi)

sqrt(freqL * freqH)

f=logspace(0,7,1000);
k=1;
n=1;
cent_S=1000*2*pi*i;
Vmax=0;


for k = 1:numel(f)

  s=2*pi*f(k)*i;
  
  tplot(k)=t(s,C1,C2,R1,R2,R3,R4);
  Vout(k)=tplot(k)*Vi;
  
  if(k>1 && Vout(k)>Vout(k-1)) 
    Vmax=Vout(k);
  endif
  
  Zi(k)=R1+1/(i*2*pi*f(k)*C1);
  Zo(k)=(1/R2+i*2*pi*f(k)*C2)^-1;
  
endfor

Zi_100=R1+1/(i*2*pi*100*C1);
Zo_100=(1/R2+i*2*pi*100*C2)^-1;


iii=1
peakG=max(abs(real(tplot)))
maxG=20*log(peakG)
while 20*log10(abs(real(tplot(iii)))) < (20*log10(peakG)-3)
iii++;
endwhile 
f(iii)

Vmax
t(cent_S,C1,C2,R1,R2,R3,R4);
%isto era suposto ser o que?



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
