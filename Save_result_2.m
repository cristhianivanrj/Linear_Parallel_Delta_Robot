function Save_result_2(F,L1,L2,L3,L4)
Dimentions=[L1 L2 L3 L4];
File = [F,L1,L2,L3,L4];
ex=fopen('Data_T.txt','a+'); 
fprintf(ex,'%12.3f    %12.3f  %12.3f  %12.3f  %12.3f    \n',File); 
fclose(ex); 
   