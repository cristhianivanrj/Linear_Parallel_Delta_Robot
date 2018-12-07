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
R_Draw = 1;%condicion para dibujar el robot,

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
    for r=1:(Resolution_cloud-1):R
        npr=round((2*pi*r)/Resolution_cloud);
        inc=(360/npr);
        for ang=0:inc:360
%% Determine coordinates
            x=r*cosd(ang);
            y=r*sind(ang);
            z=h;
%% Check Restrictions 
%1. Rws < x(i;1) < 2Rws;     
    
            q=Reverse_kinematic(Robot,x,y,z);% Calculation of the articular coordinate
            q1=q(1);    %Position for actuator 1
            q2=q(2);    %Position for actuator 2
            q3=q(3);    %Position for actuator 3  
%% Articulation angle       
            Angle=Articulation_angle(Robot,x,y,z);% calcular angulos de las rotulas
            if (sum(isnan(q))>0) || (max(q) > L4 ) %||(max(ANGLE)> 20) 
                %Apply Penalty for producing singularities
                                V1= H*pi*R^2;
                                V2= L4*pi*L1^2;
                                Hc=sqrt(L2^2-(L1-L3)^2);
                                V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); %                                 
                                %Penalty=(Penal*((round(V2*2)+ round(V1)+ round(V3*3))))/100;
                                Penalty=(Penal*((round(V2)+ round(V3)+ round(V1))))/100;
                                F= (round(V2)+ round(V3)+ round(V1))+ Penalty; 
                                %F= (round(V2)+ round(V1)+ round(V3))+ Penalty                                                
                                Save_result_2(F,L1,L2,L3,L4);                    
                                return;
            %end
            
            elseif (sum(isnan(Angle))>0) || (max(Angle) > Angle_joint ) %Maximum Angle 60° 
                                V1= H*pi*R^2;
                                V2= L4*pi*L1^2;
                                Hc=sqrt(L2^2-(L1-L3)^2);
                                V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); % 
                                Penalty=(Penal*((round(V2)+ round(V3)+ round(V1))))/100;
                                F= (round(V2)+ round(V3)+ round(V1))+ Penalty;                                    
                                Save_result_2(F,L1,L2,L3,L4);                                                   
                                return;
             
            %end
            else
                if (R_Draw == 1)
                    figure(1); clf;
                    a(i)=x;
                    b(i)=y;
                    c(i)=z;
                    Draw_delta_robot(Robot,x,y,z);
                    hold on
                    plot3(a,b,c,'LineWidth',1,'Color','magenta')%% dibujar trayectoria
                    hold on
                    pause(0.01);
                    i=i+1;
                end
            end                
           end
       end
end
% >>>>> Fitness Calculation <<<<<
V1= H*pi*R^2;
V2= L4*pi*L1^2;
Hc=sqrt(L2^2-(L1-L3)^2);
V3= (1/3)*pi*Hc*(L1^2+L3^2+L1*L3); % 
Penalty=0;
F= (round(V2)+ round(V3)+ round(V1))+ Penalty; 
Angle;
Save_result(F,L1,L2,L3,L4);
Save_result_2(F,L1,L2,L3,L4);

