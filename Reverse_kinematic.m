function q=Reverse_kinematic(Robot,x,y,z)
%>>>>> Reverse kinematic <<<<<
RR=Robot.L1-Robot.L3;
x1=RR*cosd(0);
y1=RR*sind(0);
x2=RR*cosd(120);
y2=RR*sind(120);
x3=RR*cosd(240);
y3=RR*sind(240);
% Calculation of the articular coordinate for the actuator 1
a1=Robot.L2^2;
b1=(x-x1)^2;
c1=(y-y1)^2;
d1=z+(sqrt(a1-b1-c1));
% Calculation of the articular coordinate for the actuator 2
a2=Robot.L2^2;
b2=(x-x2)^2;
c2=(y-y2)^2;
d2=z+(sqrt(a2-b2-c2));
% Calculation of the articular coordinate for the actuator 3
a3=Robot.L2^2;
b3=(x-x3)^2;
c3=(y-y3)^2;
d3=z+(sqrt(a3-b3-c3));

comp1 = isreal(d1);
comp2 = isreal(d2);
comp3 = isreal(d3);

if (comp1==1)&&(comp2==1)&&(comp3==1)
    q=[d1 d2 d3];
else 
    q=[NaN,NaN,NaN];
end
