function []=Q5f_6(L,M)
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
%p(2).MarkerEdgeColor='b';
xlabel('Real') % x-axis label
ylabel('Imaginary') % y-axis label
legend('Pole','Zero')
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



