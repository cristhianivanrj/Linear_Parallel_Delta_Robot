%clc, clear all
global H;
global R;
global Angle_joint;
global Resolution_cloud;
global Penal;
%% >>>>> Receive input data <<<<<

 L1= 171.461;      %Radius of base [R_b]
 L2= 242.461;      %Length of links [L_e]
 L3= 50.000;        %Mobile platform radio [R_m]
 L4= 542.461;
 Angle_joint= 90; %Angle Max joint
 Resolution_cloud=10;
%171.461       242.461        50.000       542.461
%% >>>>> Declaration of variables <<<<< 
%% >>>>> Worksapace <<<<< 
R=100;% Cylinder radius
H=300;% Cylinder height
%% >>>>> Worksapace <<<<< 
%Angle_joint= 30; %Angle Max joint
%% >>>>> Resolution Cloud Verification <<<<< 
%Resolution_cloud=5;
%Penal=10;%
x = [L1,L2,L3,L4];
%% >>>>> Simulate robot operation <<<<<
F=Simulate_function(x)


