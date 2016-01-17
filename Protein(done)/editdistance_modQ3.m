function []=editdistance_modQ3
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
FF=['The minimum edit distance from A to B is ', num2str(D(M+1,N+1))];
disp(FF)

a=M+1;
b=N+1;
K=[0];
while (a~=1)&&(b~=1),
    P=D(a-1,b-1);
    O=D(a-1,b);
    I=D(a,b-1);
    if A(a-1)==B(b-1)
        s=0;
    else
        s=1;
    end
    if P==D(a,b)-s,
        if P==D(a,b),
            %match:1
            a=a-1;
            b=b-1;
            K=[1;K];
        else %replace:2
            a=a-1;
            b=b-1;
            K=[2;K];
        end
    else if (O==D(a,b)-1)
            %deletion:3
            a=a-1;
            b=b;
            K=[3;K];
        else %insert:4
        a=a;
        b=b-1;
        K=[4;K];
        end
    end
end

TT=size(K);
i=1;
j=1;
for n=1:TT(1,1),
    switch(K(n,1))
        case 1
            disp(['Match ', A(i), ' with ', B(j)'])
            i=i+1;
            j=j+1;
        case 2
            disp(['Replace ', A(i), ' with ', B(j)'])
            i=i+1;
            j=j+1;
        case 3
            disp(['Delete ', A(i)])
            i=i+1;
            j=j;
        case 4
            disp(['Insert ', B(j)])
            j=j+1;
            i=i;
    end
end

            
            
