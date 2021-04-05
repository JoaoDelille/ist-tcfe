dados=fopen("./data.txt",'r');
array = fscanf(dados,'R1 = %e \nR2 = %e\nR3 = %e \nR4 = %e \nR5 = %e \nR6 = %e \nR7 = %e \nVs = %e \nC = %e \nKb = %e \nKd = %e');
fclose(dados)

R1 = array(1)
R2 = array(2)
R3 = array(3)
R4 = array(4)
R5 = array(5)
R6 = array(6)
R7 = array(7)
Vs = array(8)
C  = array(9)
Kb = array(10)
Kd = array(11)



fprintf ( fopen("values.cir", "w") , 'Analise do t2 para corrente direta, o C funciona como circuito aberto.\n.options savecurrents\nVs   1    0   %g \nR1   1    2   %gk\nR2   2    3   %gk \nR3   2    5   %gk \nR4   0    5   %gk \nR5   5    6   %gk \nR6   0   7.1  %gk \nVe  7.1  7.2  0\nR7  7.2   8   %gk \nCc   6    8   %gu\nHc  5 8  Ve   %gm \nGb  6 3 (2,5) %gm \n' , array(1) , array(2) , array(3) , array(4) , array(5) , array(6) , array(7) ,  array(8),  array(9) , array(10) ,  array(11))
printf ("\nSuccess!\n")

