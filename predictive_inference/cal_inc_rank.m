function r=cal_inc_rank(new,y,yhat)
n=length(y);
y=[y;new];
for i=1:n+1
    s(i)=norm(y(i)-yhat);
end
snew=norm(new-yhat);
r=1/(n+1)*sum(s<=snew); % inconsistance rank of the new
end