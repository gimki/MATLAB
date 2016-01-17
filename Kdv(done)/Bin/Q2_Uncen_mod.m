function [Main]=Q2_Uncen_mod(x_0,A,d,t,x,kk)
%x_0 initial point, A: magnitude of wave
%d delta value; t=step of time; x=step of space
%kk time at which it evaluate
D=((12*d^2)/A)^0.5;
X=1/x;
T_d=int32(1/t);
KK=int32(kk/t)+1;
Main=zeros(3*(X),T_d+1);
%each column represent 0.01 time
%each row represent 0.01 width
%first 2 row and last 2 row repeated and overlapped
POS=zeros(X+1,1);
for i=1:X
    x_1=x*(i-1);
    Main(i,1)=A*(sech((x_1-x_0)/D))^2;
    Main(i+X,1)=Main(i,1);
    Main(i+2*X,1)=Main(i,1);
    POS(i,1)=x_1;
end
%first column done
for j=1+X:2*X
   COM_1=-(t/(x))*(Main(j+1,1)+Main(j,1)+Main(j-1))*(Main(j+1,1)-Main(j-1,1));
   COM_2=-((t*d^2)/(2*x^3))*(Main(j+2,1)-2*Main(j+1,1)+2*Main(j-1,1)-Main(j-2,1));
   
   Main(j,2)=Main(j,1)+COM_1+COM_2;
   
   Main(j-X,2)=Main(j,2);
   Main(j+2*X,2)=Main(j,2);
   
end
%Second column done
k=t;
h=x;
for kt=3:T_d+1
    for hx=1:X+1
        Main(hx+2,kt)=Main(hx+2,kt-2)-(k/(3*h))*(Main(hx+3,kt-1)+Main(hx+2,kt-1)+Main(hx+1,kt-1))*(Main(hx+3,kt-1)-Main(hx+1,kt-1))-((k*d^2)/(h^3))*(Main(hx+4,kt-1)-2*Main(hx+3,kt-1)+2*Main(hx+1,kt-1)-Main(hx,kt-1));
    end
    Main(1,kt)=Main(X+2,2);
    Main(2,kt)=Main(X+3,2);
    Main(X+4,kt)=Main(3,2);
    Main(X+5,kt)=Main(4,2);
end

plot(POS(:,1),Main(3:X+3,KK));
end



