% Graph response
clc
load Data_T.txt;
figure(1)
% Graph response: R_b
[X,Y,Z] = sphere(16);
z = Data_T(:,2);
x = Data_T(:,1);
x_min=min(x); %The best function value found 
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
scatter3(x,y,z)
X1=y;
hold on

% Graph response: L_e
[X,Y,Z] = sphere(16);
z1 = Data_T(:,3);
scatter3(x,y,z1)

% Graph response: R_m
[X,Y,Z] = sphere(16);
z2 = Data_T(:,4);
scatter3(x,y,z2)

% Graph response: L_r
[X,Y,Z] = sphere(16);
z3 = Data_T(:,5);
scatter3(x,y,z3)

%% Graph response
figure(2)
plot(y,Data_T(:,2),'g')
grid
hold on
plot(y,Data_T(:,3),'b')
hold on
plot(y,Data_T(:,4),'r')
hold on
plot(y,Data_T(:,5),'m')

