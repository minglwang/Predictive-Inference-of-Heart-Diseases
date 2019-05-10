x1 = data(2,:)';
x2 = data(3,:)';
y = data(1,:)';
n=length(y);
PHI=[ones(n,1),x1,x2,x1.*x2];
beta=pinv(PHI)*y;