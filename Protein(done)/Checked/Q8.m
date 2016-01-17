function [Res]=Q8(n,u)
K=0;
tic
N=ceil(1000000/(n^2))
for L=1:N
    A=randi([0 1],n,1);
    B=randi([0 1],n,1);
    K=gapscoreQ8_inner(A,B,u)+K;
end
K=K/N;
Res=(1/(n))*K;
toc
end
function [ANS]=gapscoreQ8_inner(A,B,C)
M=length(A);
N=length(B);
D=zeros(M+1,N+1);
%boundary condition
D(1,1)=0;
for t=2:M+1
    D(t,1)=C;
end
for t=2:N+1,
    D(1,t)=C;
end
for k=2:M+1;
    for s=2:N+1,
        %set the three comparison
        F=max(D(1:k-1,s))+C;
        E=max(D(k,1:s-1))+C;
        if A(k-1)==B(s-1),
            G_1=1;
        else G_1=-1;
        end
        G=D(k-1,s-1)+G_1;
        D(k,s)=max([E,F,G]);
    end
end
ANS=D(M+1,N+1);
end
            
            

