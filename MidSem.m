% Sudarshan Rao
% BL.AI.U4AID25064
% question - 1
clc
clear
close all

E=100e9;
A=0.01;
L=1;
Ke=(E*A/L)*[1 -1;-1 1];

disp(Ke)

n=4;
K=zeros(n,n);
for i=1:n-1
  K(i:i+1,i:i+1)+=Ke;
end

disp(K)

F=[0;100;0;0];
disp(F);
Kred=K(2:3,2:3);
Fred=F(2:3,1);

Ured=Kred\Fred;
U=zeros(4,1);
U(2:3)=Ured;

disp(U);


% Sudarshan Rao
% BL.AI.U4AID25064
% question - 2
clc
clear
close all
Ke=60*[1 -1;-1 1];
n=6;
K=zeros(n,n);
for i=1:n-1
  K(i:i+1,i:i+1)+=Ke;
end
disp(K)

%Boundary conditions
F=[24;48;48;48;48;24];
disp(F);

F(2)=48-(-60)*100;
F(6)+=(-720);

Kred=K(2:end,2:end);
Fred=F(2:end,1);

Tred=Kred\Fred;
T=zeros(n,1);
T(1,1)=100;
T(2:end)=Tred;

disp(T);

Treal=[100;91.6;82.4;72.4;61.6;50];
Terror=Treal-T;
disp(Terror);


% Sudarshan Rao
% BL.AI.U4AID25064
% question - 3
clc
clear
close all

function Kl = stiffness(E,A,L,theta)

k=(E*A/L);
c=cos(theta);
s=sin(theta);
Ke=[k 0 -k 0;0 0 0 0;-k 0 k 0;0 0 0 0];
R=[c -s 0 0;s c 0 0;0 0 c -s;0 0 s c];
Kl=R*Ke*R';

end

E=200e9;
A=0.0025;
L=10;
n=2;
t1=pi/3;
t2=2*pi/3;
Kg=zeros(6,6);
Kg(1:4,1:4)+=stiffness(E,A,L,t1);
Kg(3:6,3:6)+=stiffness(E,A,L,t2);
F=[0;0;0;-1200;0;0];
U=zeros(6,1);
%Boundary Conditions
Kred=Kg(3:4,3:4);
Fred=F(3:4,1);
Ured=Kred\Fred;
U(3:4)=Ured;
disp(U);
%STRAINS
strain1=(1/L)*(-cos(t1)*U(1)-sin(t1)*U(2)+cos(t1)*U(3)+sin(t1)*U(4))
strain2=(1/L)*(-cos(t2)*U(5)-sin(t2)*U(6)+cos(t2)*U(3)+sin(t2)*U(4))



% Sudarshan Rao
% BL.AI.U4AID25064
% question - 4
clc
clear all

x=0.4243;
K=1e4*[1.5 0 -1.5 0 0 0;0 0 0 0 0 0;-1.5 0 1.9243 -x -x x;
0 0 -x x x -x;0 0 -x x x -x; 0 0 x -x -x x];
U=[0;0;-0.0533;-0.2419;0;0];
F=K*U;
disp(F);
E=30e6;
A1=0.4;
A2=0.5;
L1=10;
L2=10*sqrt(2);
strain1=(U(3)-U(1))/L1;
stress1=E*strain1;
theta=-pi/4;
c=cos(theta);
s=sin(theta);
strain2=(1/L2)*[-c -s c s]*[U(5);U(6);U(3);U(4)];
stress2=E*strain2;
disp(stress1);
disp(stress2);
%Hence, rod 1 is compressed.
%rod 2 becomes tensile.

A=[0 0];
B=[10 0];
C=[0 10];
Ad=A+[U(1) U(2)];
Bd=B+[U(3) U(4)];
Cd=C+[U(5) U(6)];
figure
plot([A(1) B(1)],[A(2) B(2)],'b')
hold on
plot([C(1) B(1)],[C(2) B(2)],'b')
plot([Ad(1) Bd(1)],[Ad(2) Bd(2)],'r--')
plot([Cd(1) Bd(1)],[Cd(2) Bd(2)],'r--')
axis equal
grid on
title("Original and Deformed Shape")
