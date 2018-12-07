close all, clear, clc, clear all;
tic;
global H;
global R;
global Angle_joint;
global Resolution_cloud;
global Penal;
global L1;
global L2;
global L3;
global L4;

%% >>>>> Declaration of variables <<<<< 
%% >>>>> Worksapace <<<<< 
load Poblacion;
R=125;% Cylinder radius
H=300;% Cylinder height
%% >>>>> Worksapace <<<<< 
Angle_joint= 85; %Angle Max joint
%% >>>>> Resolution Cloud Verification <<<<< 
Resolution_cloud=25;
Penal=400;%
FitnessFunction = @Objective_function; % Function handle to the fitness function
numberOfVariables = 4; % Number of decision variables
PopulationSize_Data = 100;
CrossoverFraction_Data= 0.15;
Max_Generations=1500;
Max_StallGenLimit=750;
InitialPopulation_Data=Poblacion;
lb = [R;50;50;H]; % Lower bound
ub = [2*R;400;100;3*H]; % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints
%Start with the default options
options = gaoptimset;
options = gaoptimset(options,'PopulationSize' ,PopulationSize_Data);
options = gaoptimset(options,'CrossoverFraction' ,CrossoverFraction_Data);
options = gaoptimset(options,'InitialPopulation' ,InitialPopulation_Data);
options = gaoptimset(options,'Generations',Max_Generations);
options = gaoptimset(options,'StallGenLimit',Max_StallGenLimit);
%options = gaoptimset(options,'Display', 'iter');
%options = gaoptimset(options,'PlotFcns',{  @gaplotbestindiv  @gaplotexpectation @gaplotgenealogy @gaplotrange @gaplotscorediversity @gaplotscores @gaplotselection @gaplotstopping});
options = gaoptimset(options,'PlotFcns',{  @gaplotdistance @gaplotselection @gaplotgenealogy @gaplotstopping @gaplotmaxconstr @gaplotbestindiv });
[x,Fval,exitFlag,Output,population,scores] = ga(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,[],options)

figure(1)
plot(x,Fval,'+');
hold on
tiempo=toc;
%%%>>>>> Start Verification <<<<< 
L1=x(1);
L2=x(2);
L3=x(3);
L4=x(4);
x = [L1,L2,L3,L4];
%% >>>>> Simulate robot operation <<<<<
F=Simulate_function(x)

% Optimization terminated: average change in the fitness value less than options.FunctionTolerance.
% 
% x =
% 
%   171.4609  242.4609   50.0000  542.4605
% 
% 
% Fval =
% 
%     73721067


