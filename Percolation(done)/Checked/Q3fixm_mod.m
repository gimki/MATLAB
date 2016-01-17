function Q3fixm_mod(m)
T=[];
for n=100:20:600,
W=percolationQ2_mod(m,n,0.5,0.7);
W=sum(W,2);
K=find(W);
P=0.5+(K(1)-1)*0.01;
T=[T;n,P];
end
plot (T(:,1),T(:,2))