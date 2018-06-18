# Parallel_linear_delta_robot
Contains the files used to calculate the optimal dimensions of the linear delta parallel robot

1). To perform the optimization calculation it is necessary to execute the file "Run_optimize.m" and modify the following variables according to the requirement.

Parameters to modify in the file "Run_optimize.m":

%% >>>>> Declaration of variables <<<<< 
%% >>>>> Worksapace <<<<< 
R=100;% Cylinder radius
H=250;% Cylinder height
%% >>>>> Worksapace <<<<< 
Angle_joint= 60; %Angle Max joint
%% >>>>> Resolution Cloud Verification <<<<< 
Resolution_cloud=10;
Penal=30;%

2). To perform the verification and simulation of the robot, the file "Simulate_Results.m" must be executed, modifying the parameters according to the obtained results and the input parameters.



Parameters to modify in the file "Simulate_Results.m":

%% >>>>> Receive input data <<<<<
L1=126;      %Radius of base [R_b]
L2=234;      %Length of links [L_e]
L3=1;        %Mobile platform radio [R_m]
L4=585;
%% >>>>> Declaration of variables <<<<< 
%% >>>>> Worksapace <<<<< 
R=100;% Cylinder radius
H=250;% Cylinder height
%% >>>>> Worksapace <<<<< 
Angle_joint= 60; %Angle Max joint
%% >>>>> Resolution Cloud Verification <<<<< 
Resolution_cloud=10;
Penal=100;%



3). . Run "Graph_Respuest.m" to get the graphical response

