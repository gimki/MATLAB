function [Q]=powergraph(xstart,xend,N)
format long
%plotting the error change for power series and actual answer
A=productinner(N);
B=flip(A);
B=B';
syms t
syms y
for x=xstart:0.1:xend,
    Q(int16((x-xstart)/0.1+1),1)=x;
    I=poly2sym(B,y);
    Q(int16((x-xstart)/0.1+1),2)=(subs(I,y,x)-(1+x)^0.5);
end
Q
ezplot((poly2sym(B,t)-(1+t)^0.5),[xstart,xend]);

end
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
