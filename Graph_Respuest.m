% Graph response
clc
load Data.txt;
figure(5)
% Graph response: R_b
[X,Y,Z] = sphere(16);
z = Data(:,2);
x = Data(:,1);
Filas=size(Data);
inter=(1:1:Filas);
y=inter; % Number of Interactions
scatter3(x,y,z)
hold on

% Graph response: L_e
[X,Y,Z] = sphere(16);
z = Data(:,3);
scatter3(x,y,z)

% Graph response: R_m
[X,Y,Z] = sphere(16);
z = Data(:,4);
scatter3(x,y,z)

% Graph response: L_r
[X,Y,Z] = sphere(16);
z = Data(:,5);
scatter3(x,y,z)

%% Graph response

figure(6)
plot(y,Data(:,2),'g')
grid
hold on
plot(y,Data(:,3),'b')
hold on
plot(y,Data(:,4),'r')
hold on
plot(y,Data(:,5),'m')

