%main3 script

%dados------------------------------------------
V1  = 12.6 %amp da volt do gerador
phi = 0    %fase do get
Von = 0.65  %volt de ativacao do diodo
Vd  = Von;

f  = 50     %freq
om = 2*pi*f %freq angular

r = 0.08    %resistencia do diodo

C   = 10*10^(-6) %capacidade condensador
Z_C = 1/(i*om*C) %impedancia do condensador

Rpar = 2*10^7 %resistencia em paralelo com o condensador
ReqC = Rpar;  %resistencia vista do condensador
R    = [ReqC, Rpar];

Vs  =  V1.*sqrt((e.^(i*phi)).^2);
n   =  0.2;
m   =  40000
p_i = 0

intervalo=linspace(p_i,n,m);%intervalo da voltagem

Vt = 26*10^-3;
Is = 0.01*10^(-12)

%---------------------------------------------------

V   = leinosforc(Vs,Vd,r,C,Z_C,Rpar);
Vm  = V;
t0f = p_i;
Vmforc3 = 0;

for k = 1:numel(intervalo)
    t = intervalo(k);
  
   V3(k) = Vm(3);
   V1(k) = Vm(1);
  
   if(real(Vm(1))-real(Vm(3))>=Vd)
   
      Vm = [V(1)*freqPh(om,t),V(2)*freqPh(om,t),V(3)*freqPh(om,t)];
   
      if(k=1)
        Vmforc3=Vm(3);
      endif
      
      Vm(3) = Vm(3)+(Vmforc3-Vm(3))*e^(-(t-t0f)/(Rpar*C));
      Vmnat = Vm(3);
      
      t0n = t;
      %printf("ON");
      
   endif

   if(real(Vm(1))-real(Vm(3))<Vd)
      Vm = [V(1)*freqPh(om,t),V(2)*freqPh(om,t),leinonat(Rpar,C,t,Vmnat,Vs,t0n)];
      Vmforc3 = Vm(3);
      
      t0f = t;
     % printf("OFF");
      
   endif
  
endfor

hold on
plot(intervalo, real(V3) , ".");
hold on
plot(intervalo, real(V1) , ".");
print("Condensador", "-dpng");
