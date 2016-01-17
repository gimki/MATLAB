function [Q]=Q4powergraph(xstart,xend,N)
format long
%plotting for power series
A=Q4productinner(N);
B=flip(A);
B=B';
syms t
syms y
for x=xstart:0.1:xend,
    Q(int16((x-xstart)/0.1+1),1)=x;
    I=poly2sym(B,y);
    Q(int16((x-xstart)/0.1+1),2)=(subs(I,y,x));
end
ezplot((poly2sym(B,t)),[xstart,xend]);
end
