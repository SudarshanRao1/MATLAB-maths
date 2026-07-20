%5.2.1      Sai Raj Hanuman AID25022
r=5;
l=3;

dx=0.1;
dt=0.0005;  %Stable=0.0005 Unstable=0.01

mu=r*dt/(dx^2);

x=0:dx:l;
x=x';

n=length(x);

A=zeros(n-2,n-2);

for i=1:n-2
    for j=1:n-2
        if abs(i-j)==1
            A(i,j)=mu;
        elseif i==j
            A(i,j)=1-2*mu;
        endif
    endfor
endfor

xp=x(2:end-1);

B=xp.*(xp-1).*(xp-3);

for k=1:10
    figure(k)
    plot(xp,B);
    axis([0 3 -5 5]);
    title(['Stable Solution, step = ',num2str(k)]);
    drawnow;
    B=A*B;
endfor


clc;
%5.2.3        Sai Raj Hanuman AID25022
clear;

dx = 0.1;     %a) dx=0.2 b)dx=0.1
dt = 0.001;     %a) dt = 0.005  b) dt=0.001

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


clc;
%5.2.2      Sai Raj Hanuman AID25022
clear;

dx = 0.05;     %b) dx=0.05  a) dx=0.1
dt = 0.005;     %b) dt=0.005  a) dt=0.00125

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
