function F=Objective_function(x)
%%>>>>> Receive chromosomes <<<<<
L1=x(1);        %Radius of base [R_b]
L2=x(2);        %Length of links [L_e]
L3=x(3);        %Mobile platform radio [R_m]
L4=x(4);        %Length of rail [L_r]
%% >>>>> Workspace parameters <<<<< 
global H;
global R;
global Angle_joint;
global Resolution_cloud;
global Penal;
Angle_joint = evalin('base','Angle_joint'); % Cylinder radius
H = evalin('base','H'); % Cylinder radius
R = evalin('base','R'); % Cylinder height
Resolution_cloud = evalin('base','Resolution_cloud'); 
Penal = evalin('base','Penal'); 

%% >>>>> Parameters geometric model of the robot <<<<< 
Robot.L1=L1;    %Radius of base [R_b]
Robot.L2=L2;    %Length of links [L_e]
Robot.L3=L3;    %Mobile platform radiol [R_m]
Robot.L4=L4;    %Length of rail [L_r]
set(gcf,'Color',[1,1,1]);
i=1;
j=1;
T=H;
%% >>>>> Kinematic verification <<<<<
% Point cloud construction 
for h=(0):Resolution_cloud:T
    for r=1:Resolution_cloud:R
        npr=round((2*pi*r)/Resolution_cloud);
        inc=(360/npr);
        for ang=0:inc:360
%% Determine coordinates
            x=r*cosd(ang);
            y=r*sind(ang);
            z=h;
%% Check Restrictions 
            q=Reverse_kinematic(Robot,x,y,z);% Calculation of the articular coordinate
%% Articulation angle       
            Angle=Articulation_angle(Robot,x,y,z);% calcular angulos de las rotulas
            if (sum(isnan(q))>0) || (max(q) > L4 ) %||(max(ANGLE)> 20) 
                %Apply Penalty for producing singularities
                                V1= H*pi*R^2;
                                V2= L4*pi*L1^2;
                                Hc=sqrt(L2^2-(L1-L3)^2);
                                V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); % 
                                Penalty=(Penal*((round(V2)+ round(V1)+ round(V3))))/100
                                F= (round(V2)+ round(V1)+ round(V3))+ Penalty                                                
                                Save_result(F,L1,L2,L3,L4)                    
                    return;
            end
            
            if (sum(isnan(Angle))>0) || (max(Angle) > Angle_joint ) %Maximum Angle 60° 
                                V1= H*pi*R^2;
                                V2= L4*pi*L1^2;
                                Hc=sqrt(L2^2-(L1-L3)^2);
                                V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); % 
                                Penalty=(Penal*((round(V2)+ round(V1)+ round(V3))))/100
                                F=[round(V2)+ round(V1)+ round(V3)]+ Penalty                                            
                                Save_result(F,L1,L2,L3,L4)                                                   
                    return;
            end                                                   
           end
       end
end
% >>>>> Fitness Calculation <<<<<
V1= H*pi*R^2;
V2= L4*pi*L1^2;
Hc=sqrt(L2^2-(L1-L3)^2);
V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); % 
Penalty=0
F= (round(V2)+ round(V1)+ round(V3))+ Penalty 
Save_result(F,L1,L2,L3,L4)

