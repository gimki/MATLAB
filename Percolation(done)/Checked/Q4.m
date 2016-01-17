function [K]=Q4(m,n,p)

[W]=percolationQ2_mod(m,n,p,p);

K=(log(W(1)))/n;
end
