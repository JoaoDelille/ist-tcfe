R=15000
C=1e-5
f=50
w=2*pi*f
T=1/f
A=230
N_voltas=19.1
n=1000
N_P=10
Von=0.7


t=linspace(0, T*N_P, n+1) 

% Transformador 

A_total=A/N_voltas

Vs=A*cos(w*t) 

%Envelope

t_off1=(1/w)*atan(1/(w*R*C)) 
t_off2=t_off1:(T/2):T*10 



% Rectificador DE ONDA 

Vlim=3*Von 
 for i=1:length(t)
   if Vs(i)>Vlim
       Vo(i)=Vs(i); 
   
   elseif Vs(i)<Vlim
       Vo(i)=-Vs(i);
   
   endif
 endfor  
%
figura = figure();
plot ( t , Vo ); 
hold on;

xlabel ("t");
ylabel ("Vo");
title ("Rectificador de onda");

print (figura, "Rect_onda", "-dpng");
hold off


% Função de decaimento 

i=1
for j=1:length(t_off2) 
  
  if j==1
    
    while t(i)<(T/2)*j 
      V0exp(i)= abs (A*cos(w*t_off2(j))*exp(-(t(i)-t_off2(j))/(R*C)));
      i=i+1; 
    endwhile  
  
  elseif j~=1 
    
    while (T/2)*(j-1)<=t(i) && t(i)<(T/2)*j 
      V0exp(i)= abs(A*cos(w*t_off2(j))*exp(-(t(i)-t_off2(j))/(R*C))); 
      i=i+1;
    endwhile
  else
    
  endif
endfor


%
V0exp(i)= abs(A*cos(w*t_off2(j))*exp(-(t(i)-t_off2(j))/(R*C))) 

figura = figure();
plot ( t , V0exp); 
hold on;

xlabel ("t");
ylabel ("V0exp");
title ("Função de Decaimento");

print (figura, "Fun_Dec", "-dpng");
hold off

% Função Saw-Tooth (penso que seja este o nome)
length(t)
length(Vo)
length(V0exp)
length(t_off2)



i=1 
for j=1:length(t_off2) 
  
  if j==1
    
    while t(i)<t_off2(j)
      
      vf(i)=Vo(i);
      
      i=i+1;
    endwhile
    
    while V0exp(i)>Vo(i) && t(i)>=t_off2(j)
      
      vf(i)=V0exp(i); 
      
      i=i+1;
    endwhile 
    
    while t(i)<(T/2)*j
      
      vf(i)=Vo(i);
      
      i=i+1; 
    endwhile
    
  elseif j~=1  
    
    while t(i)<t_off2(j)
      
      vf(i)=Vo(i);
      
      i=i+1;
    endwhile
    
    while V0exp(i)>Vo(i) 
      
      vf(i)=V0exp(i); 
      
      i=i+1;
    endwhile 
    
    while t(i)<(T/2)*j
      
      vf(i)=Vo(i);
      
      i=i+1; 
    endwhile 
    
   else
 endif 
 
endfor
% 
vf(i)=Vo(i)
length(vf)


figura = figure();
plot ( t , vf , "r"); 
hold on;

xlabel ("t");
ylabel ("Vf");
title ("Função Saw-Tooth");

print (figura, "Saw_Tooth", "-dpng");
hold off
% Regulador de Voltagem 

Num_Diod=20
r_Diod=0.7
R2=1000

V_DC=mean(vf)
V_AC=vf-V_DC 

V_AC_final=( (Num_Diod*r_Diod)/(Num_Diod*r_Diod+R2))*V_AC
V_final=V_AC_final+V_DC 
V_ripple=max(V_final)-min(V_final) 
disp(V_DC) 

figura = figure();
plot ( t , V_final); 
hold on;

xlabel ("t");
ylabel ("V_final");
title ("Função da Voltagem Final");

print (figura, "V_final", "-dpng");
hold off


printf('Tudo bem\n')
 
% A fazer: descobrir melhores valores estão um pouco ao calhas e adicionar gráficos