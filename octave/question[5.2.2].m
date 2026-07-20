%5.2.2
% sudarshan rao
% BL.AI.U4AID25064

clc;
clear;

dx = 0.05;     %b) dx=0.05  a) dx=0.1
dt = 0.00125;     %b) dt=0.005  a) dt=0.00125

mu = dt/(dx^2);

x = 0:dx:1;
x = x';

n = length(x);

% Initial condition
U = zeros(n,1);

for i=1:n
    xi = x(i);

    if xi <= 1/3
        U(i) = 2*abs(xi-1/6)-1/3;

    elseif xi <= 2/3
        U(i) = 0;

    else
        U(i) = 1/2 - 3*abs(xi-5/6);
    endif
endfor

% Boundary conditions
U(1)=0;
U(n)=0;

for k=1:20
    figure(k)
    plot(x,U,'LineWidth',2);
    axis([0 1 -0.5 0.5]);
    title(['dx = 0.1, Time step = ',num2str(k)]);
    drawnow;

    Unew = U;

    for i=2:n-1
        Unew(i)=U(i)+mu*(U(i+1)-2*U(i)+U(i-1));
    endfor

    U = Unew;

endfor
