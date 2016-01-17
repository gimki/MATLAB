function [PO,ZE]=Q5f_1(L,M)
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
P=flip(P');
ZE=programB(P);
Q=[1;Q];
Q=flip(Q');
PO=programB(Q);
disp('Poles occur at ');
PO
disp('Zeros occur at ');
ZE
p=plot(real(PO),imag(PO),'g*', real(ZE),imag(ZE),'bo');
p(1).MarkerEdgeColor='k';
p(1).MarkerFaceColor='k';
p(2).MarkerEdgeColor='b';

xlabel('Real') % x-axis label
ylabel('Imaginary') % y-axis label
legend('Pole','Zero')
end