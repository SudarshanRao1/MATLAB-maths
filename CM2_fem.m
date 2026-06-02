
E=;
A=;
N=;
L=;


U=K\F;
dU = U(2:end,1)-U(1:end-1,1);
dx=L/N;
strain = dU/dx;
stress=E*strain;
f=E*A*strain;

function Ke = stiffnessmatrix(E,A,L,N)
    delx=L/N;
    k=E*A/delx;
    Ke=[k -k;-k k];
end

function fe = externalforce(n,L,N)
    delx=L/N;
    fe=n*[delx/2;delx/2];
end

function [K,F] = globalequation(Ke,N)
    K=zeros(N);
    F=zeros(N,1);
    for j=1:N
        Ke= stiffnessmatrix(E,A,L,N);
        fe= externalforce(n,L,N);
        K(j:j+1,j:j+1) = K(j:j+1,j:j+1) + Ke;
        F(j:j+1,1) = F(j:j+1,1) + fe;
    end
end