function [C]=f_5productinner
A=zeros(101,1);
B=zeros(101,1);
C=zeros(101,1);
A(1,1)=1;
B(1,1)=1;
for k=1:100,
    A(k+1,1)=A(k,1)/k;
    B(k+1,1)=-1*B(k,1);
end
for i=1:101,
    sum=0;
    for j=1:i,
        sum=sum+A(j)*B(i-j+1);
    end
    C(i,1)=sum;
end
end