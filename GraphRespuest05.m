% Graph response
clc
load recorrido.txt;
figure(6)
% Graph response: R_b
%[X,Y,Z] = sphere(16);
c1 = recorrido(:,1);
c2 = recorrido(:,2);
c3 = recorrido(:,3);

%x_min=min(x); %The best function value found 
Filas=size(recorrido);
inter=(1:1:Filas);
X1=inter'; % Number of Interactions
%scatter3(x,y,z)
hold on


%% Graph response

plot(X1,c1,'g')
grid
hold on
plot(X1,c2,'b')
hold on
plot(X1,c3,'m')
hold on


