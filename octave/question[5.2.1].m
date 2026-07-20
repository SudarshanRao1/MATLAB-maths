% sudarshan rao
% BL.AI.U4AID25064

r = 5;
l = 3;

dx = 0.1;
dt = 0.0005;

mu = r*dt/(dx^2);

x = 0:dx:l;
x = x';

n = length(x);

a = zeros(n-2 , n-2);

for i = 1:n-2
    for j = 1:n-2
        if abs(i-j) == 1
            A(i,j) = mu;
        elseif i == j
            A(i,j) = 1-2*mu;
        end
    end
end

xp = x(2:end-1);

B = xp.*(xp-1).*(xp-3);

for k = 1:10
    figure(k)
    plot(xp , B);
    axis([0 3 -5 5]);
    title(['Stable Solutions , step = ' , num2str(k)]);
    drawnow;
    B = A*B;
end

