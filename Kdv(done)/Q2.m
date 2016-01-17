function [Main]=Q2_Euler(x_0,A,d,t,x)
D=((12*d^2)/A)^0.5;
X=1/x;
T_d=1/t;
Main=nan(X+1+4,T_d+1);
%each column represent 0.01 time
%each row represent 0.01 width
%first 2 row and last 2 row repeated and overlapped
POS=zeros(X+1,1);
for i=1:X+1
    x_1=x*(i-1);
    Main(i+2,1)=A*(sech((x_1-x_0)/D))^2;
    POS(i,1)=x_1;
end
%first column done

for j=1:X+1
    x_2=x*(j-1);
    phi=(x_2-x_0)/D;
    S=sech(phi);
    T=tanh(phi);
    u_t=(A/D)*S^2*T*(2*A*S^2-(4*A*S^2)/3+(3*A/2)*T^2);
    Main(j+2,2)=Main(j+2,1)+t*u_t;
    if x_2==0.26 || x_2==0.24
        u_t
    end
end
Main(1,2)=Main(X+2,2);
Main(2,2)=Main(X+3,2);
Main(X+4,2)=Main(3,2);
Main(X+5,2)=Main(4,2);
%Second column done
k=t;
h=x;
for kt=3:T_d+1
    for hx=1:X+1
        %COM_A_1=(k/(3*h))*(Main(hx+3,kt-1)+Main(hx+2,kt-1)+Main(hx+1,kt-1));
        %COM_A_2=(Main(hx+3,kt-1)-Main(hx+1,kt-1));
        %%%%%
        %COM_B=((k*d^2)/(x^3))*(Main(hx+4,kt-1)-2*Main(hx+3,kt-1)+2*Main(hx+1,kt-1)-Main(hx,kt-1));
        %Main(hx+2,kt)=Main(hx+2,kt-2)-COM_A_1*COM_A_2-COM_B;
        Main(hx+2,kt)=Main(hx+2,kt-2)-(k/(3*h))*(Main(hx+3,kt-1)+Main(hx+2,kt-1)+Main(hx+1,kt-1))*(Main(hx+3,kt-1)-Main(hx+1,kt-1))-((k*d^2)/(x^3))*(Main(hx+4,kt-1)-2*Main(hx+3,kt-1)+2*Main(hx+1,kt-1)-Main(hx,kt-1));
    end
    Main(1,kt)=Main(X+2,2);
    Main(2,kt)=Main(X+3,2);
    Main(X+4,kt)=Main(3,2);
    Main(X+5,kt)=Main(4,2);
end
plot(POS(:,1),Main(3:X+3,7501));
end



