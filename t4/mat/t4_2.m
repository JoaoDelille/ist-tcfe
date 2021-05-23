%gain stage

VT=25e-3
BFN=178.7
VAFN=69.7
RE1=1015
C_in=365*10^(-6)

RC1=980
RB1=80000
RB2=20000
VBEON=0.7
VCC=12
RS=100

C=4390*10^(-6)
C2=2250*10^(-6)

l=0;

Rl=8;
<<<<<<< HEAD:t4/t4_2.m
while k<=8
  while n<10
    l=l+1;
      f=n*10^(k-1);

      int(l)=f;
      Zc=1/(i*2*pi*f*C);
      Zc2=1/(i*2*pi*f*C2);
      Zc_in=1/(i*2*pi*f*C_in);
=======

f=logspace(-1,8,100);
for l = 1:length(f)
     %f=n*10^(k-1);

      int(l)=f(l);
      printf('%g\n',log10(int(l)))
      Zc=1/(i*2*pi*f(l)*C);
      Zc2=1/(i*2*pi*f(l)*C2);
      Zc_in=1/(i*2*pi*f(l)*C_in);
>>>>>>> 1a793ebc1b4069fa84bae486488d5457d23b98be:t4/mat/t4_2.m
      %--
      RE1_vdd=1015;
      %--
      RB=1/(1/RB1+1/RB2);
      VEQ=RB2/(RB1+RB2)*VCC;
      IB1=(VEQ-VBEON)/(RB+(1+BFN)*RE1);
      IC1=BFN*IB1;
      IE1=(1+BFN)*IB1;
      VE1=RE1*IE1;
      VO1=VCC-RC1*IC1;
      VCE=VO1-VE1;
      
      %----
      RE1_vdd=1015;
      RE1=(1/RE1_vdd+1/Zc)^(-1);
      RS1=RS+Zc_in;
      %-----
      gm1=IC1/VT;
      rpi1=BFN/gm1;
      ro1=VAFN/IC1;
      
      AV1_normal = (RB/(RS1+RB))*RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*((1/RB+1/RS1)^(-1)+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2);

      AV1simple = gm1*RC1/(1+gm1*RE1);

      RE1=0;
      %%RE1=Zc;
      AV1 = RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2);
      AV1simple = gm1*RC1/(1+gm1*RE1);

        %----
      RE1_vdd=1015;
      RE1=(1/RE1_vdd+1/Zc)^(-1);
      %-----

      ZI1 = ((ro1+RC1+RE1)*(RB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1);

      ZX = ro1*((RB+rpi1)*RE1/(RB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RB)+1/RE1+gm1*rpi1/(rpi1+RB)));

      ZO1 = 1/(1/ZX+1/RC1);



      %ouput stage
      BFP = 227.3;
      VAFP = 37.2;
      RE2 = 2335;
      VEBON = 0.7;
      VI2 = VO1;
      IE2 = (VCC-VEBON-VI2)/RE2;
      IC2 = BFP/(BFP+1)*IE2;
      VO2 = VCC - RE2*IE2;


      gm2 = IC2/VT;
      go2 = IC2/VAFP;
      gpi2 = gm2/BFP;
      ge2 = 1/RE2;

      AV2 = gm2/(gm2+gpi2+go2+ge2);



      ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(gpi2+go2+ge2);

      ZO2 = 1/(gm2+gpi2+go2+ge2);
      %condensador
      AV3=Rl/(Rl+Zc2);
      
      %--
      gain(l)=AV1*AV2*AV3;
<<<<<<< HEAD:t4/t4_2.m
      gain2(l)=AV1_normal*AV2*AV3;
      n=n+1;
  endwhile
  n=1;
  k=k+1;
endwhile
%hold on
figure(1)
plot(log(int), 20*log(gain) , ".");
print("GAIN_Exprimental_R3_a_0", "-dpng");

figure(2)
plot(log(int), 20*log(gain2) , ".");
=======
      gain2(l)=AV1_normal*AV2;

endfor

iii=1
peakG=max(gain2)
while real(20*log10(gain2(iii))) < (20*log10(peakG)-3)
iii++
endwhile 

fprintf ( fopen("Impedancias.tex", "w") , '\n $Z_{in}$ & $Z_{out}$ \\\\ \n %g \\Omega   & %g \\Omega\\\\\n' , ZI2 , ZO2 )
fprintf ( fopen("Cutoff.tex", "w") , '\n min cut-off frequency \\\\ \n %g \\\\\n' , int(iii))

figure(1)
plot(log10(int), 20*log10(gain) , ".");
print("GAIN_Exprimental_R3_a_0", "-dpng");

figure(2)
plot(log10(int), 20*log10(gain2) , ".");
>>>>>>> 1a793ebc1b4069fa84bae486488d5457d23b98be:t4/mat/t4_2.m
print("GAINVERDADEIRO", "-dpng");

