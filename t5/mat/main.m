C1=220*10^-9;
C2=220*10^-9;
R1=1000
R2=500
R3=100000+100000+100000
R4=10000
Vi=10



omegaL=1/(C1*R1);

omegaH=1/(C2*R2);

cent_S=sqrt(omegaL * omegaH);
cent_f=cent_S/(2*pi)

f=logspace(0,7,1000);
f_lin = logspace(0, 7, 1000);
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

for k =1:numel(f_lin)
	s_lin=2*pi*f_lin(k)*i;
	Vout_lin(k)=t(s_lin,C1,C2,R1,R2,R3,R4)*Vi;
endfor


Zo_cent=(1/R2+i*2*pi*cent_f*C2)^-1;
Zi_cent=R1+1/(i*2*pi*cent_f*C1);

fprintf ( fopen("Z.tex", "w") , '$Z_{in}$ & %g +i ( %g ) & %g \\\\ \n $Z_{out}$ & %g+ i ( %g ) & %g\\\\' , real(Zi_cent), imag(Zi_cent),abs(Zi_cent), real(Zo_cent), imag(Zo_cent), abs(Zo_cent));



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

%fprintf ( fopen("f_c.tex", "w") , '$Frequency_{center}$ & %g \\\\ \n $LowFrequency_{cutoff}$ & %g \\\\ \n $HighFrequency_{cutoff}$ & %g \\\\ \n $Frequency V_{max}$ & %g \\\\ Delille $Frequency_{center}$ & %g \\\\ \n Delille $LowFrequency_{cutoff}$ & %g \\\\ \n Delille $HighFrequency_{cutoff}$ & %g \\\\' ,cent_f ,(omegaL)/(2*pi),omegaH/(2*pi), f_vmax, fcentdel ,f(iii), f(jjj));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%foi o delille que adicionou, nao mexi no resto, faz o que quiseres com isto


fprintf ( fopen("f_c.tex", "w") , '$Frequency V_{max}$ & %g \\\\ $Frequency_{center}$ & %g \\\\ \n $LowFrequency_{cutoff}$ & %g \\\\ \n  $HighFrequency_{cutoff}$ & %g \\\\' , f_vmax, fcentdel ,f(iii), f(jjj));



V_target=Vi*t(2*pi*1000,C1,C2,R1,R2,R3,R4);
V_gain_khz=V_target/Vi;

fprintf ( fopen("Vkhz.tex", "w") , '$V_{out_{1KHz}}$ & %g \\\\ \n $V_{in}$ & %g \\\\ \n $Gain$ & %g V/V \\\\\\\\' , V_target,Vi,V_gain_khz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




plot(log10(f), (Vout) , ".");
title ("Vout in function of frequency");
ylabel ("V");
xlabel ("log(f)");
print("gain", "-dpng");

%plot(log10(f), 20*log10(angle(Vout)) , ".");
%title ("PHASE ANGLES THINGY");
%ylabel ("dB");
%xlabel ("log(Hz)");
%print("phase", "-dpng");

plot(log10(f_lin), (angle(Vout_lin))*180/pi , ".");
title ("Phase of frequency response");
ylabel ("Degrees");
xlabel ("Hz");
print("phase_deg", "-dpng");

plot(log10(f), (tplot) , ".");
title ("Gain");
ylabel ("V/V");
xlabel ("log(f)");
print("T(s)", "-dpng");




plot(log10(f*2*pi), 20*log10(Zi) , "."); %nao e necessario
title ("Zi");
ylabel ("dB");
xlabel ("log(Re(s)");
print("Zi", "-dpng");

plot(log10(f*2*pi), 20*log10(Zo) , "."); %nao e necessario
title ("Zo");
ylabel ("dB");
xlabel ("log(Re(s)");
print("Zo", "-dpng");

