function [RES]=trapezium_energy(A,h)
T=size(A);
K=T(1,1);
F=0.5*(((A(1,1))^2)+((A(K,1))^2));
for i=2:(K-1)
F=F+(A(i,1))^2;
end
RES=0.5*h*F;
end