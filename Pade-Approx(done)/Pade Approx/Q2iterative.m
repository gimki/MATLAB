function [Dy]=Q2iterative(L,M,n)

C=productinner(100);
C=C';
T=padeqcoefficientinner(L,M);
for i=1:n
    
A_1=zeros(M, M);
C_back=zeros(M,1);
for a=(L+2):(L+M+1),
    C_back(a-L-1)=C(1,a);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%
for r=(L+1):(L+M)
    min_rm=min(r, M);
    for k=1:min_rm,
        A_1((r-L),k)=C(1,r-k+1);
    end
end
Q=-A_1\C_back;
Dy=A_1\(-C_back-A_1*T);
T=T+Dy;
end
end

function [Q]=padeqcoefficientinner(L,M)
%Solve equations (4) and (5) given the coefficients c_k
%and values of L and M. Also evaluate the resulting Pade approximant 
%for set of values x
format long
%remark: c_0 at first place
C=productinner(100);
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
A_1;
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



