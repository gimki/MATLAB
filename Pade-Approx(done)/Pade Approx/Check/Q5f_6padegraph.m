function [Q]=Q5f_6padegraph(xstart,xend,M,L)
C=f_6productinner';
Q=zeros(10*(xend-xstart)+1,2);
for x=xstart:0.1:xend,
    Q(int16((x-xstart)/0.1+1),1)=x;
    Q(int16((x-xstart)/0.1+1),2)=(abs(Q5f_6padeinner(L,M,x)-(1+x+x^2)^0.5));
end
plot(Q(:,1),Q(:,2));
%plotting error between pade approx and actual curve
end

function [R]=Q5f_6padeinner(L,M,x)
%1st Programming task for Proj 7.5
%Solve equations (4) and (5) given the coefficients c_k
%and values of L and M. Also evaluate the resulting Pade approximant 
%for set of values x
format long
%remark: c_0 at first place
C=f_6productinner;
C=C';
A_1=zeros(M, M);
C_back=zeros(M,1);
for a=(L+2):(L+M+1),
    C_back(a-L-1)=C(1,a);
end
C_back;
%%%%%%%%%%%%%%%%%%%%%%%%%%

for r=(L+1):(L+M)
    min_rm=min(r, M);
    for k=1:min_rm,
        A_1((r-L),k)=C(1,r-k+1);
    end
end
Q=-A_1\C_back;

P=zeros(1,L+1);
P(1,1)=C(1);
for k=1:L
    T=0;
    min_km=min(k,M);
    for s=1:min_km,
        T=T+Q(s)*C(k-s+1);
    end
    P(1,k+1)=C(k+1)+T;
end
P=P';

X_M=zeros(M,1);
for r=1:M,
    X_M(r,1)=x^r;
end
X_M;
X_L=zeros(L+1,1);
for r=0:L,
    X_L(r+1,1)=x^r;
end
X_L;
P;
Q;
numer=P'*X_L;
denum=1+Q'*X_M;
R=numer/denum;
end
function [C]=f_6productinner
A=zeros(101,1);
B=zeros(101,1);
C=zeros(101,1);
a_1=complex(-0.5,((3^0.5)/2));
a_2=complex(-0.5,-((3^0.5)/2));
A(1,1)=1;
A(2,1)=-0.5/a_1;
B(1,1)=1;
B(2,1)=-0.5/a_2;
for k=2:100,
    A(k+1,1)=((2*k-3)/(2*a_1))*A(k,1)/k;
    B(k+1,1)=((2*k-3)/(2*a_2))*B(k,1)/k;
end
for i=1:101,
    sum=0;
    for j=1:i,
        sum=sum+A(j)*B(i-j+1);
    end
    C(i,1)=sum;
end
end

