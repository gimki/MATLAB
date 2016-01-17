function Q3fixn(n)
T=[];
for m=100:100:4000,
W=percolationQ2_mod(m,n,0.5,0.7);
W=sum(W,2);
K=find(W);
P=0.5+(K(1)-1)*0.01;
T=[T;m,P];
end
plot (T(:,1),T(:,2))
