function F=Simulate_function(x)
%%>>>>> Receive input data <<<<<
L1=x(1);        %Radius of base [R_b]
L2=x(2);        %Length of links [L_e]
L3=x(3);        %Mobile platform radio [R_m]
L4=x(4);        %Length of rail [L_r]
Simulate = 1;
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
%%  >>>>> Set graphics <<<<< 
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
%% coordenadas plataforma movil
            x=r*cosd(ang);
            y=r*sind(ang);
            z=h;                           
%% Determine coordinates
            x=r*cosd(ang);
            y=r*sind(ang);
            z=h;
            
            %% Check Restrictions 
            q=Reverse_kinematic(Robot,x,y,z);% Calculation of the articular coordinate
            q1=q(1);    %Position for actuator 1
            q2=q(2);    %Position for actuator 2
            q3=q(3);    %Position for actuator 3  
            Record_position(q1,q2,q3);
            
            %% Articulation angle                     
            Angle=Articulation_angle(Robot,x,y,z);
            if (sum(isnan(q))>0) || (max(q) > L4 )              
                    F = 200;                 
                    return;
            end
            
%% Draw           
            if Simulate 
                figure(1); clf;
                    if (max(Angle)<= Angle_joint) 
                        figure(1);                         
                        cla;
                        if h < T
                            a(i)=x;
                            b(i)=y;
                            c(i)=z;
                            riel.d1(i)=q(1);
                            riel.d2(i)=q(2);
                            riel.d3(i)=q(3);
                            plot3(a,b,c,'*','LineWidth',2,'MarkerEdgeColor',[0.2,0.2,0.4],...
                                'MarkerFaceColor','y','MarkerSize',4)%% Draw path
                            hold on                           
                            Draw_delta_robot(Robot,x,y,z);
                            hold on
                            
                        else
                            a(i)=0;
                            b(i)=0;
                            c(i)=T+3;
                            plot3(a,b,c,'*','LineWidth',1,'MarkerEdgeColor',[0.2,0.2,0.4],...
                                'MarkerFaceColor','y','MarkerSize',4)%% Draw path
                            hold on
                            Draw_delta_robot(Robot,0,0,h);
                            hold on                            
                            r=R;
                        end
                        pause(0.01);
                        i=i+1;
                    end
            end  
            end
        end
    end

F=200

