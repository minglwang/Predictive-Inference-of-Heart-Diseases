function theta_star=major_min(X,theta_0,Y)
m_max=1000;
theta(:,1)=theta_0;
for m=1:m_max
sigm=exp(X*theta(:,m))./(ones(size(X,1),1)+exp(X*theta(:,m)));
theta(:,m+1)=theta(:,m)+4*inv(X'*X)*X'*(Y-sigm);
gap=norm(theta(:,m+1)-theta(:,m));
    if gap<0.1
        theta_star=theta(:,m+1);
        break
    end
end