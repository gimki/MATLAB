function [A]=productinner(N)
format long
A=zeros(N+1,1);
A(1,1)=1;
A(2,1)=0.5;
%generating the coefficient of the power series of (1+x)^0.5 in a column
%vector
for k=2:N,
    A(k+1,1)=((A(k,1))/2)*(-1)*(2*(k-1)-1)/(k);
end
end


