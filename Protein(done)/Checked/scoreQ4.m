function [D]=scoreQ4
A=input('please enter the first string: ');
B=input('please enter the second string: ');
M=length(A);
N=length(B);
D=zeros(M+1,N+1);
Order='CSTPAGNDEQHRKMILVFYW';
B62=blosum(62,'order',Order);


%boundary condition
D(1,1)=0;
for t=2:M+1
    D(t,1)=(t-1)*(-8);
end
for t=2:N+1,
    D(1,t)=(t-1)*(-8);
end
for k=2:M+1;
    for s=2:N+1,
        %set the three comparison
        W=D(k-1,s)-8;
        X=D(k,s-1)-8;
        Y_1= strfind(Order,A(k-1));
        Y_2= strfind(Order,B(s-1));
        Y=D(k-1,s-1)+B62(Y_1,Y_2);
        D(k,s)=max([W,X,Y]);
    end
end
FF=['The maximum score from A to B is ', num2str(D(M+1,N+1))];
disp(FF)

a=M+1;
b=N+1;
K=[0];
R=0;
while (a~=1)&&(b~=1),
    P=D(a-1,b-1);
    O=D(a-1,b);
    I=D(a,b-1);
    R=0;
    if O==(D(a,b)+8),
        %deletion:3
            a=a-1;
            K=[3;K];
            R=1;
    else if I==(D(a,b)+8),
        %insert:4
        b=b-1;
        K=[4;K];
        R=1;
        end
    end
    if R==0,
        if A(a-1)==B(b-1),
            %matching
            a=a-1;
            b=b-1;
            K=[1;K];
        else 
            %replace
            a=a-1;
            b=b-1;
            K=[2;K];
        end
        R=1;
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

            
            
