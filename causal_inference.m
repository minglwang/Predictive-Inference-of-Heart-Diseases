% (a)
bddata0 = load('data_bloodpressure_02_x0.csv');
bddata1 = load('data_bloodpressure_02_x1.csv');
m0 = length(bddata0(1,:));
m1 = length(bddata1(1,:));
y = [bddata0(1,:),bddata1(1,:)]';
w = [bddata0(2,:),bddata1(2,:)]';
x = [zeros(1,size(bddata0,2)),ones(1,size(bddata1,2))]';
X = [ones(length(x),1),x,w,x.*w];
beta = inv(X'*X)*X'*y;
pred = beta(2)+beta(4)*w;
avepred = mean(pred);

% (b)
XX=[ones(size(w,1),1),w];
yy=x;
[~, n] = size(XX);
% Initialize fitting parameters
initial_beta = zeros(n, 1);
options = optimoptions('fminunc','SpecifyObjectiveGradient',true);
[beta, cost] = fminunc(@(beta) (costFunction(beta, XX, yy)), initial_beta, options);
class=round(sigmoid(XX*beta));
accuracy=mean(double(class == yy)) * 100;
p=sigmoid(XX*beta);

Ey0=mean(1./ (1-p(1:m0)).* y(1:m0));
Ey1=mean(1./ p(m0+1:end).*y(m0+1:end));
aveweighted=Ey1-Ey0;

