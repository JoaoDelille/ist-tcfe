C1=1*10^-6;
C2=1*10^-6;
R1=1000
R2=500
R3=100000+10000+10000
R4=1000
Vi=10



omegaL=1/(C1*R1);

omegaH=1/(C2*R2);

cent_S=sqrt(omegaL * omegaH);
cent_f=cent_S/(2*pi)

f=logspace(0,7,1000);
k=1;
n=1;

f_vmax=-1;

Vmax=0;


for k = 1:numel(f)

  s=2*pi*f(k)*i;
  
  tplot(k)=t(s,C1,C2,R1,R2,R3,R4);
  Vout(k)=tplot(k)*Vi;
  
  if(k>1 && Vout(k)>Vout(k-1)) 
    Vmax=Vout(k);
    f_vmax=f(k);
  endif
  
  Zi(k)=R1+1/(i*2*pi*f(k)*C1);
  Zo(k)=(1/R2+i*2*pi*f(k)*C2)^-1;
  
endfor


Zo_cent=(1/R2+i*2*pi*cent_f*C2)^-1;
Zi_cent=R1+1/(i*2*pi*cent_f*C1);

fprintf ( fopen("Z.tex", "w") , '$Z_{out}$ & %g +i ( %g ) & %g \\\\ \n $Z_{in}$ & %g+ i ( %g ) & %g\\\\' , real(Zo_cent), imag(Zo_cent),abs(Zo_cent), real(Zi_cent), imag(Zi_cent), abs(Zi_cent));



Vo_cent=Vi*t(cent_S,C1,C2,R1,R2,R3,R4);
Vo_b1 = Vi*t(2*pi*omegaL,C1,C2,R1,R2,R3,R4);
Vo_b2 = Vi*t(2*pi*omegaH,C1,C2,R1,R2,R3,R4);

fprintf ( fopen("Vo_oc.tex", "w") , '$V_{out_{center}}$ & %g \\\\ \n $V_{low_{cutoff}}$ & %g \\\\ \n $V_{high_{cutoff}}$ & %g \\\\ $V_{center} from graph$ & %g \\\\' , Vo_cent,Vo_b2,Vo_b2,Vmax);



iii=1
peakG=max(abs(real(tplot)))
maxG=20*log(peakG)
while 20*log10(abs(real(tplot(iii)))) < (20*log10(peakG)-3)
iii++;
endwhile
jjj=iii; 
while 20*log10(abs(real(tplot(jjj)))) >= (20*log10(peakG)-3)
jjj++;
endwhile 
fcentdel= sqrt(f(iii)*f(jjj));

fprintf ( fopen("f_c.tex", "w") , '$Frequency_{center}$ & %g \\\\ \n $LowFrequency_{cutoff}$ & %g \\\\ \n $HighFrequency_{cutoff}$ & %g \\\\ \n $Frequency V_{max}$ & %g \\\\ Delille $Frequency_{center}$ & %g \\\\ \n Delille $LowFrequency_{cutoff}$ & %g \\\\ \n Delille $HighFrequency_{cutoff}$ & %g \\\\' ,cent_f ,(omegaL)/(2*pi),omegaH/(2*pi), f_vmax, fcentdel ,f(iii), f(jjj));




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

