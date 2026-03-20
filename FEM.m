

L=15;
E=30e6;
A=0.7;
N=3;
dx=L/N;
Kg=zeros(4,4);
Ug=zeros(4,1);
Fg=[5 5 5 5]';

Ug(1,1)=0; %Given node 1 is fixed,thus u1=0 (Displacement of node1)
Ug(4,1)=0;
function Kl = localstiffness(E,A,L,N)
  dx=L/N;
  k=E*A/dx;
  Kl=[k -k;-k k];
end

for j=1:N
  Ke = localstiffness(E,A,L,N);
  Kg(j:j+1,j:j+1)+=Ke;
end

K=Kg(2:end-1,2:end-1);
U=Ug(2:end-1,1);
f=Fg(2:end-1,1);

%Calculation of displacements
U=K\f;
Ug(2:end-1,1)=U
delU=Ug(2:end,1)-Ug(1:end-1,1)
Strain=delU/dx
Stress=E*Strain
Fint=E*A*Strain
Kg
Fg

