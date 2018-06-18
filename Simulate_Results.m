clc, clear all
%% >>>>> Receive input data <<<<<
L1=126;      %Radius of base [R_b]
L2=234;      %Length of links [L_e]
L3=1;        %Mobile platform radio [R_m]
L4=585;
global H;
global R;
global Angle_joint;
global Resolution_cloud;
global Penal;
%% >>>>> Declaration of variables <<<<< 
%% >>>>> Worksapace <<<<< 
R=100;% Cylinder radius
H=250;% Cylinder height
%% >>>>> Worksapace <<<<< 
Angle_joint= 60; %Angle Max joint
%% >>>>> Resolution Cloud Verification <<<<< 
Resolution_cloud=10;
Penal=100;%
x = [L1,L2,L3,L4];
%% >>>>> Simulate robot operation <<<<<
F=Simulate_function(x)

