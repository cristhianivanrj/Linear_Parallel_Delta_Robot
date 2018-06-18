function Record_position(q1,q2,q3) 
    Riel=[q1    q2   q3];
    File = [q1,q2,q3];
    ex=fopen('recorrido.txt','a+'); 
     fprintf(ex,'%12.3f  %12.3f    %12.3f    \n',File); 
    fclose(ex); 
   