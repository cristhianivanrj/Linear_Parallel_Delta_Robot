function ANG = Articulation_angle(Robot,x,y,z)
%>>>>>  Check Restrictions  <<<<<
%>>>>> Articulation_angle <<<<<
q=Reverse_kinematic(Robot,x,y,z);
pD1_1 = [0 , 0, q(1) ];
pD1_2 = [Robot.L1 , 0, q(1) ];
pD1_3 = [Robot.L3+x , 0+y, q(1) ];

pD2_1 = [0, 0, q(2)];
pD2_2 = [(Robot.L1*cosd(120)) , (Robot.L1*sind(120)), q(2)];
pD2_3 = [(Robot.L3*cosd(120))+x , (Robot.L3*sind(120))+y , q(2)];

pD3_1 = [0, 0, q(3)];
pD3_2 = [(Robot.L1*cosd(240)) , (Robot.L1*sind(240)), q(3)];
pD3_3 = [(Robot.L3*cosd(240))+x , (Robot.L3*sind(240))+y , q(3)];


A1=sqrt(((pD1_1(1)-pD1_2(1))^2)+((pD1_1(2)-pD1_2(2))^2)+((pD1_1(3)-pD1_2(3))^2));
B1=sqrt(((pD1_2(1)-pD1_3(1))^2)+((pD1_2(2)-pD1_3(2))^2)+((pD1_2(3)-pD1_3(3))^2));
C1=sqrt(((pD1_3(1)-pD1_1(1))^2)+((pD1_3(2)-pD1_1(2))^2)+((pD1_3(3)-pD1_1(3))^2));

A2=sqrt(((pD2_1(1)-pD2_2(1))^2)+((pD2_1(2)-pD2_2(2))^2)+((pD2_1(3)-pD2_2(3))^2));
B2=sqrt(((pD2_2(1)-pD2_3(1))^2)+((pD2_2(2)-pD2_3(2))^2)+((pD2_2(3)-pD2_3(3))^2));
C2=sqrt(((pD2_3(1)-pD2_1(1))^2)+((pD2_3(2)-pD2_1(2))^2)+((pD2_3(3)-pD2_1(3))^2));

A3=sqrt(((pD3_1(1)-pD3_2(1))^2)+((pD3_1(2)-pD3_2(2))^2)+((pD3_1(3)-pD3_2(3))^2));
B3=sqrt(((pD3_2(1)-pD3_3(1))^2)+((pD3_2(2)-pD3_3(2))^2)+((pD3_2(3)-pD3_3(3))^2));
C3=sqrt(((pD3_3(1)-pD3_1(1))^2)+((pD3_3(2)-pD3_1(2))^2)+((pD3_3(3)-pD3_1(3))^2));

ROT1=acosd(((A1^2)+(B1^2)-(C1^2))/(2*A1*B1));
ROT2=acosd(((A2^2)+(B2^2)-(C2^2))/(2*A2*B2));
ROT3=acosd(((A3^2)+(B3^2)-(C3^2))/(2*A3*B3));


ANG=[ROT1, ROT2, ROT3];

