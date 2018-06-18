close all, clear, clc, clear all;
tic;
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
Penal=30;%
FitnessFunction = @Objective_function; % Function handle to the fitness function
numberOfVariables = 4; % Number of decision variables
PopulationSize_Data = 20;
CrossoverFraction_Data=0.8;
load Poblacion;
InitialPopulation_Data=Poblacion;
lb = [R;50;0;H]; % Lower bound
ub = [1000;1000;100;1000]; % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints
%Start with the default options
options = gaoptimset;
options = gaoptimset(options,'PopulationSize' ,PopulationSize_Data);
options = gaoptimset(options,'CrossoverFraction' ,CrossoverFraction_Data);
options = gaoptimset(options,'InitialPopulation' ,InitialPopulation_Data);
options = gaoptimset(options,'PlotFcns' ,{  @gaplotbestf @gaplotbestindiv @gaplotdistance @gaplotexpectation @gaplotgenealogy @gaplotrange @gaplotscorediversity @gaplotscores @gaplotselection @gaplotstopping @gaplotmaxconstr });
options = gaoptimset(options,'OutputFcns' ,{ [] });
[x,Fval,exitFlag,Output,population,scores] = ga(FitnessFunction,numberOfVariables,A,b,Aeq,beq,lb,ub,[],options)
figure(1)
plot(x,Fval,'+');
hold on
tiempo=toc;
%%%>>>>> Start Verification <<<<< 
Simulate_Results

