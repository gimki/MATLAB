function Q1(Nstart,Nend)
%sketch graph for Q1 error and N
H=zeros(Nend-Nstart+1,2);
    for x=Nstart:Nend
    A=productinner(x);
    B=sum(A);
    scatter(x,(B-(2)^0.5));
    H(x-Nstart+1,2)=B-(2)^0.5;
    H(x-Nstart+1,1)=x;
    hold on
    end
    %plot(fit(H(:,1),H(:,2),'exp2'))
    hold off
end

    