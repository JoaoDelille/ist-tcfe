%gain stage

VT=25e-3
BFN=178.7
VAFN=69.7
RE1=1015
C_in=365*10^(-9)

RC1=980
RB1=80000
RB2=20000
VBEON=0.7
VCC=12
RS=100
k=1
n=1
f=1;
C=4390*10^(-9)
C2=2250*10^(-9)
l=0;
Rl=8;
while k<=8
  while n<10
    l=l+1;
      f=n*10^(k-1);

      int(l)=f;
      Zc=1/(i*2*pi*f*C);
      Zc2=1/(i*2*pi*f*C2);
      Zc_in=1/(i*2*pi*f*C_in);
      %--
      RE1_vdd=100;
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
      RE1_vdd=100;
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
      RE1_vdd=100;
      RE1=(1/RE1_vdd+1/Zc)^(-1);
      %-----

      ZI1 = ((ro1+RC1+RE1)*(RB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1);

      ZX = ro1*((RB+rpi1)*RE1/(RB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RB)+1/RE1+gm1*rpi1/(rpi1+RB)));

      ZO1 = 1/(1/ZX+1/RC1);



      %ouput stage
      BFP = 227.3;
      VAFP = 37.2;
      RE2 = 100;
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
print("GAINVERDADEIRO", "-dpng");

