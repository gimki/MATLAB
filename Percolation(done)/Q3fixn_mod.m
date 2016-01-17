function Q3fixn_mod(n)
T=[];
for m=100:100:7000,
W=percolationQ2_mod(m,n,0.45,0.75);
W=sum(W,2);
K=find(W);
P=0.5+(K(1)-1)*0.01;
T=[T;m,P];
end
plot (T(:,1),T(:,2))
