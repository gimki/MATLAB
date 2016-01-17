function [Main]=Q4_Euler(d,t,x,kk,tend)
%Function approximating in Q4 with initial condition sin wave
%x_0 initial point,
%d delta value; t=step of time; x=step of space
%kk time at which it evaluate
%tend be the ending of approximation of t
A=1;
X=1/x;
T_d=int32((tend)/t);
KK=int32(kk/t)+1;
Main=zeros(X+1+4,T_d+1);
%each column represent 0.01 time
%each row represent 0.01 width
%first 2 row and last 2 row repeated and overlapped
POS=zeros(X+1,1);
for i=1:X+1
    x_1=x*(i-1);
    Main(i+2,1)=sin(2*pi*x_1);
    POS(i,1)=x_1;
end
%first column done

for j=1:X+1
    x_2=x*(j-1);
    u_t=2*pi*cos(2*pi*(x_2));
    Main(j+2,2)=Main(j+2,1)+t*u_t;
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
        Main(hx+2,kt)=Main(hx+2,kt-2)-(k/(3*h))*(Main(hx+3,kt-1)+Main(hx+2,kt-1)+Main(hx+1,kt-1))*(Main(hx+3,kt-1)-Main(hx+1,kt-1))-((k*d^2)/(x^3))*(Main(hx+4,kt-1)-2*Main(hx+3,kt-1)+2*Main(hx+1,kt-1)-Main(hx,kt-1));
    end
    Main(1,kt)=Main(X+2,kt);
    Main(2,kt)=Main(X+3,kt);
    Main(X+4,kt)=Main(3,kt);
    Main(X+5,kt)=Main(4,kt);
end
plot(POS(:,1),Main(3:X+3,KK));
end



