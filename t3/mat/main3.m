%main3 script

%dados------------------------------------------
V1=10 %amp da volt do gerador
phi=0 %fase do get
Von=0.87%volt de ativacao do diodo
Vd=0.87;

f=50 %freq
om=2*pi*f

r=0.8 %res do diodo

C=100*10^(-6) %capacidade condensador
Z_C=1/(i*om*C) %impedancia do condensador

Rpar = 2*10^3 %resistencia em paralelo com o condensador
ReqC= Rpar;  %(1/(2*r)+1/Rpar)^(-1); %resistencia vista do condensador
R=[ReqC, Rpar];

Vs=V1.*sqrt((e.^(i*phi)).^2);
n=20.05;
m=10000
p_i=20
intervalo=linspace(p_i,n,m);%intervalo da voltagem

Vt=26*10^-3;
Is=0.01*10^(-12)

%---------------------------------------------------

V=leinosforc(Vs,Vd,r,C,Z_C,Rpar);
Vm=V;
Vmforc3=0;
t0f=p_i;
 for k=1:numel(intervalo)
  t=intervalo(k);
  
V3(k)=Vm(3);
V1(k)=Vm(1);
  
  if(real(Vm(1))-real(Vm(3))>=Vd)
     Vm=[V(1)*freqPh(om,t),V(2)*freqPh(om,t),V(3)*freqPh(om,t)];
    if(k=1)
      Vmforc3=Vm(3);
    endif
    Vm(3)=Vm(3)+(Vmforc3-Vm(3))*e^(-(t-t0f)/(Rpar*C));
    Vmnat=Vm(3);
    t0n=t;
    printf("ON");
  endif

  if(real(Vm(1))-real(Vm(3))<Vd)
     Vm=[V(1)*freqPh(om,t),V(2)*freqPh(om,t),leinonat(Rpar,C,t,Vmnat,Vs,t0n)];
     Vmforc3=Vm(3);
     t0f=t;
    printf("OFF");
  endif
  
endfor
%
ripple=real(max(V3)-min(V3))
hold on
plot(intervalo, real(V3) , ".");
hold on
plot(intervalo, real(V1) , ".");
print("Condensador", "-dpng");