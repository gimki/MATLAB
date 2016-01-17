function scoreQ11
A=input('please enter the first string: ');
B=input('please enter the second string: ');
M=length(A);
N=length(B);
D=zeros(M+1,N+1);
Order='CSTPAGNDEQHRKMILVFYW';
B62=blosum(62,'order',Order);


for k=2:M+1;
    for s=2:N+1,
        %set the three comparison
        W=D(k-1,s)-2;
        X=D(k,s-1)-2;
        Y_1= strfind(Order,A(k-1));
        Y_2= strfind(Order,B(s-1));
        Y=D(k-1,s-1)+B62(Y_1,Y_2);
        D(k,s)=max([W,X,Y,0]);
    end
end
FF=['The v_sub from A to B is ', num2str(max(D(:)))];
disp(FF)

end



            
            
