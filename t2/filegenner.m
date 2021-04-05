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
