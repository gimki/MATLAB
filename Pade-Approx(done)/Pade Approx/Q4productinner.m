function [A]=Q4productinner(N)

A=zeros(N+1,1);

for k=0:N,
    P=factorial(k);
    A(k+1,1)=((-1)^k)*P;
end
end


