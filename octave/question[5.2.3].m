% 5.2.3
clc;
clear;

dx = 0.2;     %a) dx=0.2 b)dx=0.1
dt = 0.005;     %a) dt = 0.005  b) dt=0.001

mu = 3*dt/(dx^2);

x = -1:dx:1;
x = x';

n = length(x);

% Initial condition
U = zeros(n,1);

% Boundary conditions
U(1) = 1;
U(n) = -1;


for k=1:20
  figure(k)

    plot(x,U,'LineWidth',2);

    Unew = U;

    for i=2:n-1
        Unew(i)=U(i)+mu*(U(i+1)-2*U(i)+U(i-1));
    endfor

    % Reapply boundary conditions
    Unew(1)=1;
    Unew(n)=-1;

    U = Unew;

endfor

title('dx = 0.2');
xlabel('x');
ylabel('u(x,t)');
grid on

