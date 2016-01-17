function [RES]=trapezium_mass(A,h)
T=size(A);
K=T(1,1);
F=A(1,1)+A(K,1);
for i=2:(K-1)
F=F+2*(A(i,1));
end
RES=0.5*h*F;
end