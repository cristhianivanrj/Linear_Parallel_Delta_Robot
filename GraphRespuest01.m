clc
close all
clear all
load Data_T.txt;
z = Data_T(:,2);
x = Data_T(:,1);
x_min=min(x); %The best function value found 
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
%scatter3(x,y,z)
X1=y;
axes1 = axes;
hold(axes1,'on');
Filas=size(Data_T);
inter=(1:1:Filas);
y=inter; % Number of Interactions
%scatter3(x,y,z)
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


