function Save_result(F,L1,L2,L3,L4)
ver=F
Dimentions=[L1 L2 L3 L4]
File = [F,L1,L2,L3,L4];
ex=fopen('Data.txt','a+'); 
fprintf(ex,'%12.3f    %12.3f  %12.3f  %12.3f  %12.3f    \n',File); 
fclose(ex); 
   