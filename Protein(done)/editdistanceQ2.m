function [D]=editdistanceQ2
A=input('please enter the first string: ');
B=input('please enter the second string: ');
M=length(A);
N=length(B);
D=zeros(M+1,N+1);
%boundary condition
D(1,1)=0;
for t=2:M+1
    D(t,1)=t-1;
end
for t=2:N+1,
    D(1,t)=t-1;
end
for k=2:M+1;
    for s=2:N+1,
        %set the three comparison
        W=D(k-1,s)+1;
        X=D(k,s-1)+1;
        if A(k-1)==B(s-1),
            Y=D(k-1,s-1);
        else
            Y=D(k-1,s-1)+1;
        end
        D(k,s)=min([W,X,Y]);
    end
end
FF=['The minimum edit distance from ',A,' to ',B,' is ', num2str(D(M+1,N+1))];
disp(FF)
