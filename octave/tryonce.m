clc;
clear;

dx = 0.1;
dt = 0.002;

mu = dt/(dx^2);

x = 0:dx:1;
x = x';

n = length(x);

% Initial condition
U = x.*(1-x);

% Boundary conditions
U(1)=0;
U(n)=0;

for k = 1:50

figure(k);
plot(x,U,'LineWidth',2);
axis([0 1 0 0.3]);
title(['Diffusive Transport : Step = ',num2str(k)]);
xlabel('x');
ylabel('u(x,t)');
grid on;
drawnow;

Unew = U;

for i = 2:n-1

    uxx = (U(i+1)-2*U(i)+U(i-1))/(dx^2);

    ux = (U(i+1)-U(i))/dx;

    Unew(i)=U(i)+dt*(uxx + 2*ux);

end

Unew(1)=0;
Unew(n)=0;

U = Unew;

end

