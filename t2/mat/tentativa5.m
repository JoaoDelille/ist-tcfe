Req=4.548813287954689
C=1.00334118042

f=0.1:100:1e06;
func= -10*log10(1+(2*pi*f*Req*C).^2); 
%func= sqrt(1/(1+(2*pi*f*Req*C).^2)
hold on;
figura = figure();
plot ( f , func );

xlabel ("f");
ylabel ("func");
title ("ups errado"); 

print (figura, "ai_deus", "-dsvg"); 


%Provavelmente para ignorar, incompleto e incorrecto.