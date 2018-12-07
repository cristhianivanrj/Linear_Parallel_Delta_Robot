function Draw_delta_robot(Robot,x,y,z)
%%
q=Reverse_kinematic(Robot,x,y,z);
%% Points of the rails
p1  = [0 , 0 , 0 ];
p2  = [Robot.L1 , 0 , 0 ];
p21 = [Robot.L1 , 0 , Robot.L4 ];
p3  = [Robot.L1*cosd(120) , Robot.L1*sind(120) , 0 ];
p31 = [Robot.L1*cosd(120) , Robot.L1*sind(120) , Robot.L4 ];
p4  = [Robot.L1*cosd(240) , Robot.L1*sind(240) , 0];
p41 = [Robot.L1*cosd(240) , Robot.L1*sind(240) , Robot.L4];

%% Points of the links
p22 = [Robot.L1 , 0 , q(1) ];
p23 = [Robot.L3+x , 0+y, (z) ];
p32 = [Robot.L1*cosd(120) , Robot.L1*sind(120) , q(2)];
p33 = [(Robot.L3*cosd(120))+x , (Robot.L3*sind(120))+y , (z)];
p42 = [Robot.L1*cosd(240) , Robot.L1*sind(240) , q(3) ];
p43 = [(Robot.L3*cosd(240))+x , (Robot.L3*sind(240))+y , (z) ];

%% Points of the movil plataform
pm = [x , 0+y, z];
%%%%
line([p23(1),pm(1)],[p23(2),pm(2)],[p23(3),pm(3)],  'LineWidth',3,'Color',[0.0,0.8,0.0],'Marker','.','MarkerSize',4);
line([p43(1),pm(1)],[p43(2),pm(2)],[p43(3),pm(3)],  'LineWidth',3,'Color',[0.0,0.8,0.0],'Marker','.','MarkerSize',4);
line([p33(1),pm(1)],[p33(2),pm(2)],[p33(3),pm(3)],  'LineWidth',3,'Color',[0.0,0.8,0.0],'Marker','.','MarkerSize',4);
%%%%

line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],  'LineWidth',1,'Color',[0.4,0.4,0.6],'Marker','.','MarkerSize',1);
line([p1(1),p3(1)],[p1(2),p3(2)],[p1(3),p3(3)],  'LineWidth',1,'Color',[0.4,0.4,0.6],'Marker','.','MarkerSize',1);
line([p1(1),p4(1)],[p1(2),p4(2)],[p1(3),p4(3)],  'LineWidth',1,'Color',[0.4,0.4,0.6],'Marker','.','MarkerSize',1);

line([p2(1),p21(1)],[p2(2),p21(2)],[p2(3),p21(3)],  'LineWidth',5,'Color',[0.2,0.4,0.7],'Marker','.','MarkerSize',1);%Rieles
line([p3(1),p31(1)],[p3(2),p31(2)],[p3(3),p31(3)],  'LineWidth',5,'Color',[0.2,0.4,0.7],'Marker','.','MarkerSize',1);
line([p4(1),p41(1)],[p4(2),p41(2)],[p4(3),p41(3)],  'LineWidth',5,'Color',[0.2,0.4,0.7],'Marker','.','MarkerSize',1);

line([p22(1),p23(1)],[p22(2),p23(2)],[p22(3),p23(3)],  'LineWidth',3,'Color',[0.11,0.66,0.82],'Marker','.','MarkerSize',4); %Brazos Esalbones
line([p32(1),p33(1)],[p32(2),p33(2)],[p32(3),p33(3)],  'LineWidth',3,'Color',[0.11,0.66,0.82],'Marker','.','MarkerSize',4);
line([p42(1),p43(1)],[p42(2),p43(2)],[p42(3),p43(3)],  'LineWidth',3,'Color',[0.11,0.66,0.82],'Marker','.','MarkerSize',4);

base=patch([p2(1), p3(1), p4(1)], [p2(2), p3(2), p4(2)], ...
 [p2(3), p3(3), p4(3)],[0.9,0.9,0.9]);
set(base, 'EdgeColor', [0.9,0.9,0.9],'LineWidth',1);

%  movil= patch([p23(1), p33(1), p43(1)], [p23(2), p33(2), p43(2)], ...
%  [p23(3), p33(3), p43(3)],[0.0,0.0,0.4]);
% set(movil, 'EdgeColor', [0.0,0.0,0.4],'LineWidth',1);

%  movil= patch([p23(1), p33(1), p43(1)], [p23(2), p33(2), p43(2)], ...
%  [p23(3), p33(3), p43(3)],[0.0,0.0,0.4]);
% set(movil, 'EdgeColor', [0.0,0.0,0.4],'LineWidth',1);



grid on
view([90,90, 90 ])

