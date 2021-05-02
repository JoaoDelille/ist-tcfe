R=1000
C=1e-5
f=50
w=2*pi*f
T=1/f
A=230
N_voltas=19
n=1000
N_P=10
Von=0.7

% ESPAÇAMENTO DO TEMPO

t=linspace(0, T*N_P, n+1) 

% Transformador 

A_total=A/N_voltas

Vs=A*cos(w*t) 

%Envelope

t_off1=(1/w)*atan(1/(w*R*C)) 
t_off2=t_off1:(T/2):T*10 



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
% Regulador de Voltagem 

Num_Diod=25
r_Diod=0.8
R2=1000

V_DC=mean(vf)
V_AC=vf-V_DC 

V_AC_final=( (Num_Diod*r_Diod)/(Num_Diod*r_Diod+R2))*V_AC
V_final=V_AC_final+V_DC 
V_ripple=max(V_final)-min(V_final) 
disp(V_DC)


printf('Tudo bem\n')
 
% A fazer: descobrir melhores valores estão um pouco ao calhas e adicionar gráficos