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

%%% Figure 11 paaper %%%
%%%%%%%%%%%%%%%%%%%%%%%%

figure (3)
axes1 = axes;
hold(axes1,'on');
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
%scatter3(x,y,z)
%X1=y';%Interactions
X1=Data_T(:,1);
Y1=Data_T(:,2);
Y2=Data_T(:,3);
Y3=Data_T(:,4);
Y4=Data_T(:,5);
% Create scatter
scatter(X1,Y1,'DisplayName','R_b','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 0.447058826684952 0.74117648601532]);
% Create scatter
scatter(X1,Y2,'DisplayName','L_e','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[1 0 0]);
% Create scatter
scatter(X1,Y3,'DisplayName','R_m','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 1 0]);
% Create scatter
scatter(X1,Y4,'DisplayName','L_r','MarkerFaceColor',[1 1 1]);
% Create xlabel
xlabel('Fitness Value [mm^3]','FontSize',11);
% Create ylabel
ylabel('Solutions [mm]','FontSize',11);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[15000000 240000000]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-50 1000]);
view(axes1,[0.800000000000011 90]);
% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northeast');

%%% End Figure 11 paaper %%%
%%%%%%%%%%%%%%%%%%%%%%%% 


%%%%%%% Figue 12 paper %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (221)

axes1 = axes;
hold(axes1,'on');
clc 
clear all
load Data_T.txt;
Filas=size(Data_T);
BestFitness=int64(Data_T(:,1));
rows=Filas(1);
k=0;
n=0;
m=0;
for i=10:1:rows/100
n=n+1;
m=0;
for j=i:1:(j+10)
        m=m+1;
        k=k+1;
        n=n+1;
        %fprintf('%4f %4f',i,j);
        %aux(j)=;       
        Best(n,m)=int64(BestFitness(k));     
        %x_min=min(x); %The best function value found 
end   
end
        

%inter=(1:10:Filas);
y=inter; % Number of Interactions
%scatter3(x,y,z)
%X1=y';%Interactions
X1=Data_T(:,1);
Y1=Data_T(:,2);
Y2=Data_T(:,3);
Y3=Data_T(:,4);
Y4=Data_T(:,5);



%%%%%%% End Figure 12 paper %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




figure (4)
axes1 = axes;
hold(axes1,'on');
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
scatter3(x,y,z)
X1=y;%Interactions
%X1=Data_T(:,1);
Y1=Data_T(:,2);
Y2=Data_T(:,3);
Y3=Data_T(:,4);
Y4=Data_T(:,5);

% Create scatter
scatter(X1,Y1,'DisplayName','R_b','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 0.447058826684952 0.74117648601532]);
% Create scatter
scatter(X1,Y2,'DisplayName','L_e','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[1 0 0]);
% Create scatter
scatter(X1,Y3,'DisplayName','R_m','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 1 0]);
% Create scatter
scatter(X1,Y4,'DisplayName','L_r','MarkerFaceColor',[1 1 1]);
% Create xlabel
xlabel('Interactions','FontSize',11);
% Create ylabel
ylabel('Solutions [mm]','FontSize',11);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[15000000 240000000]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-50 1000]);
view(axes1,[0.800000000000011 90]);
% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northeast');



figure (6)
axes1 = axes;
hold(axes1,'on');
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
scatter3(x,y,z)
%X1=y;%Interactions
X1=Data_T(:,1);
Y1=Data_T(:,2);
Y2=Data_T(:,3);
Y3=Data_T(:,4);
Y4=Data_T(:,5);

% Create scatter
scatter(X1,Y1,'DisplayName','R_b','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 0.447058826684952 0.74117648601532]);
% Create scatter
scatter(X1,Y2,'DisplayName','L_e','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[1 0 0]);
% Create scatter
scatter(X1,Y3,'DisplayName','R_m','MarkerFaceColor',[1 1 1],...
    'MarkerEdgeColor',[0 1 0]);
% Create scatter
scatter(X1,Y4,'DisplayName','L_r','MarkerFaceColor',[1 1 1]);
% Create xlabel
xlabel('Interactions','FontSize',11);
% Create ylabel
ylabel('Solutions [mm]','FontSize',11);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[15000000 240000000]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-50 1000]);
view(axes1,[0.800000000000011 90]);
% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','northeast');


