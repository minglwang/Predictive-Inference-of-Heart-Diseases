function interval=find_bound(new, y, alpha)
rnew = 0;
interval = 20;
while rnew<1-alpha
rnew = cal_inc_rank(new+interval, y, new);
if rnew > 1-alpha
    break;
end
interval = interval+5;
end
end