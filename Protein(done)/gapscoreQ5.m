function []=gapscoreQ5
A=input('please enter the first string: ');
B=input('please enter the second string: ');
C=input('please enter the value of u: ');
M=length(A);
N=length(B);
D=zeros(M+1,N+1);
Order='CSTPAGNDEQHRKMILVFYW';
B62=blosum(62,'order',Order);

X=zeros(M+1,N+1);
Y=zeros(M+1,N+1);

%boundary condition
D(1,1)=0;
for t=2:M+1
    D(t,1)=(C);
    X(t,1)=3;
    Y(t,1)=1;
end
for t=2:N+1,
    D(1,t)=(C);
    X(1,t)=4;
    Y(1,t)=1;
    
end

for k=2:M+1;
    for s=2:N+1,
        %set the three comparison
        F=max(D(1:k-1,s))+C;
        F_pos=find(D(1:k-1,s)+C==F);
        E=max(D(k,1:s-1))+C;
        E_pos=find(D(k,1:s-1)+C==E);
        G_1= strfind(Order,A(k-1));
        G_2= strfind(Order,B(s-1));
        G=D(k-1,s-1)+B62(G_1,G_2);
        D(k,s)=max([E,F,G]);
        switch (D(k,s))
            case E
            %insertion
            X(k,s)=4;
            Y(k,s)=E_pos(1,1);
            case F
                %deletion
                X(k,s)=3;
                Y(k,s)=F_pos(1,1);
            case G
               if A(k-1)==B(s-1),
                  %match
                  X(k,s)=1;
               else %replace
                  X(k,s)=2;
               end
        end
    end
end
X
D
a=M+1;
b=N+1;
K=[0,0];
F=[0];
R=0;
while (a~=1)&&(b~=1),
    
    switch(X(a,b))
        case 1
            K=[a,b;K];
            a=a-1;
            b=b-1;
        case 2
            K=[a,b;K];
            a=a-1;
            b=b-1;
        case 3
            K=[a,b;K];
            a=Y(a,b);
            b=b;
        case 4
            K=[a,b;K];
            a=a;
            b=Y(a,b);
    end
end
TT=size(K);
X
i=1;
j=1;
K
for n=1:TT(1,1)-1,
    switch(X(K(n,1),K(n,2)))
        case 1
            disp(['Match ', A(i), ' with ', B(j)'])
            i=i+1;
            j=j+1;
        case 2
            disp(['Replace ', A(i), ' with ', B(j)'])
            i=i+1;
            j=j+1;
        case 3
            if n==1,
                U=K(n,1)-1;
            else
            U=K(n,1)-K(n-1,1);
            end
            for u=1:U,
                disp(['Delete ', A(i+u-1)])
            end
            i=i+U;
            j=j;
        case 4
            if n==1,
                U=K(n,2)-1;
            else
            U=K(n,2)-K(n-1,2);
            end
            for u=1:U   
                disp(['Insert ', B(j+u-1)])
            end
            j=j+U;
            i=i;
    end
end
FF=['The maximum gap-weighted score from A to B is ', num2str(D(M+1,N+1))];
disp(FF)
end
            
            
