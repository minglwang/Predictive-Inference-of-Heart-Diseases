function m= bi_search_lb(xub,xlb, y, new, alpha)
n=length(y);
R = xub;
L = xlb;
r=0;
while  abs((n+1)*r - ceil((n+1)*(1-alpha)))>0.004*(n+1)
m = floor(R+L)/2;
r = cal_inc_rank(m,y, new);
if (n+1)*r > ceil((n+1)*(1-0.05))
    L = m;
else
    R = m;
end
end


end
