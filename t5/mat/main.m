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
cent_f=1000
cent_S=cent_f*2*pi*i;
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


Zo_cent=(1/R2+i*2*pi*cent_f*C2)^-1;
Zi_cent=R1+1/(i*2*pi*cent_f*C1);
fprintf ( fopen("Z.tex", "w") , 'Z_{out} & %g \\\\ \n Z_{in} & %g \\\\' , Zo_cent, Zi_cent);

fprintf ( fopen("f_c.tex", "w") , 'Frequency_{center}} & %g \\\\ \n LowFrequency_{cutoff} & %g \\\\ \n LowFrequency_{cutoff} & %g \\\\' ,cent_f ,freqL,freqH);

Vo_cent=Vi*t(cent_S,C1,C2,R1,R2,R3,R4);
Vo_b1 = Vi*t(2*pi*freqL,C1,C2,R1,R2,R3,R4);
Vo_b2 = Vi*t(2*pi*freqH,C1,C2,R1,R2,R3,R4);
fprintf ( fopen("Vo_oc.tex", "w") , 'V_{out_{center}} & %g \\\\ \n V_{low_{cutoff}} & %g \\\\ \n V_{high_{cutoff}} & %g \\\\' , Vo_cent,Vo_b2,Vo_b2);



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
title ("Vout in function of frequency");
ylabel ("dB");
xlabel ("log(Hz)");
print("gain", "-dpng");

plot(log10(f), 20*log10(angle(Vout)) , ".");
title ("Phase in function of frequency");
ylabel ("dB");
xlabel ("log(Hz)");
print("phase", "-dpng");

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
