function [H]=Q2padegraphfp(x,Lstart,Lend)
format long
%plotting absolute value of pade

H=zeros(Lend-Lstart+1,2);
    for L=Lstart:1:Lend
        L
    B=padeinner(L,L,x)
    scatter(L,((B-(x+1)^0.5)));
    H(L-Lstart+1,2)=(B-(x+1)^0.5);
    H(L-Lstart+1,1)=L;
    hold on
    end
    hold off
    plot(H(:,1),H(:,2));
   function [R]=padeinner(L,M,x)
%1st Programming task for Proj 7.5
%Solve equations (4) and (5) given the coefficients c_k
%and values of L and M. Also evaluate the resulting Pade approximant 
%for set of values x
format long
%remark: c_0 at first place
C=productinner(1000);
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
end
