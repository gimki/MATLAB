function [W]=percolationQ2(m,n,pstart,pend)
tic
W=[];
T=nan(n,n,m);
T(1,1,:)=0;
for y=1:m,
%generate different matrix first
map=rand(n,n,2);
%1 is horizontal 2 is vertical
%coord in T is i+1,j+1
%define boundary condition
for t=2:n,
    T(1,t,y)=max(T(1,t-1,y),map(1,t-1,1));
    T(t,1,y)=max(T(t-1,1,y),map(t-1,1,2));
end
for k=2:n,
    for u=2:(n-k+1)
        ver=max(T(k-1,u,y),map(k-1,u,2));
        hor=max(T(k,u-1,y),map(k,u-1,1));
        T(k,u,y)=min(ver,hor);
    end
end
T;
O=0;
l=0;
e=[];
for p=pstart:0.01:pend,
    l=l+1;
    e=[e;p];
for z=1:n,
    if T(z,n-z+1,y)<=p
        O=1;
    end
end
W(l,y)=O;
end
end
W=sum(W,2)./m;
toc
plot(e,W)



        
