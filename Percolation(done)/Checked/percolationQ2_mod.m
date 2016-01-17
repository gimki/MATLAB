function [W]=percolationQ2_mod(m,n,pstart,pend)
%m is the number of repeats; n is value of how far we
%approximate)
%p start and p end indicates range of p for the graph and approximation
tic;
W=[];
for y=1:m,
%generate different matrix first
map=rand(n,n,2);
T=nan(n,n);
T(1,1)=0;
%1 is horizontal 2 is vertical
%coord in T is i+1,j+1
%define boundary condition
for t=2:n,
    T(1,t)=max(T(1,t-1),map(1,t-1,1));
    T(t,1)=max(T(t-1,1),map(t-1,1,2));
end
%calculate the probability of each node being accessible
for k=2:n,
    for u=2:(n-k+1)
        ver=max(T(k-1,u),map(k-1,u,2));
        hor=max(T(k,u-1),map(k,u-1,1));
        T(k,u)=min(ver,hor);
    end
end
O=0;
l=0;
e=[];
%check any nodes at distance n being accessible for different p
for p=pstart:0.01:pend,
    l=l+1;
    e=[e;p];
for z=1:n,
    if T(z,n-z+1)<=p
        O=1;
    end
end
W(l,y)=O;
end
end
W=sum(W,2)./m;
toc;
plot(e,W)
end



        
