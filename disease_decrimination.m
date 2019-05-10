clear all
data0 = load('data_heart_01_y0.csv');
data1 = load('data_heart_01_y1.csv');
n0 = size(data0,1);
n1 = size(data1,1);

figure
plot(data0(:,1),data0(:,2),'rx')
hold on
plot(data1(:,1),data1(:,2),'bo')

mu0=mean(data0);
mu1=mean(data1);
sigma0=cov(data0);
sigma1=cov(data1);
x1=[min(data0(:,1)): max(data0(:,1))];
x2=[min(data0(:,2)): max(data0(:,2))];
guass2dplot(x1, x2, mu0, sigma0,'r')
x1=[min(data1(:,1)): max(data1(:,1))];
x2=[min(data1(:,2)): max(data1(:,2))];
guass2dplot(x1, x2, mu1, sigma1,'b')
xlabel('x1')
ylabel('x2')
py0=n0/(n0+n1);
py1=n1/(n0+n1);

%% Gaussian covariate model
x1=[min(data0(:,1)): max(data0(:,1))];
x2=[min(data0(:,2)): max(data0(:,2))];
[py0condx,py1condx]=generative_model(mu0,sigma0,mu1,sigma1, x1, x2, py0, py1);
figure
plot(data0(:,1),data0(:,2),'rx')
hold on
plot(data1(:,1),data1(:,2),'bo')
contour(x1,x2,py0condx,[0.5,0.5],'linewidth',1.5);
xlabel('x1')
xlabel('x2')

%% Bernoulli approach
x1 = [data0(:,1);data1(:,1)];
x2 = [data0(:,2);data1(:,2)];
phi=[ones(length(x1),1), x1, x2];
y= [zeros(length(data0(:,1)),1);ones(length(data1(:,1)),1)];
theta_0=zeros(3,1);
theta_star=major_min(phi,theta_0,y);

%% Calculate the decision boundary 
x1=[min(data0(:,1)): max(data0(:,1))];
x2=[min(data0(:,2)): max(data0(:,2))];
[X1,X2] = meshgrid(x1,x2);
PHI=[ones(length(X1(:)),1),X1(:), X2(:)];
py1condx_logis=exp(PHI*theta_star)./(ones(size(PHI,1),1)+exp(PHI*theta_star));
py1condx_logis=reshape(py1condx_logis,length(x2),length(x1));
figure
plot(data0(:,1),data0(:,2),'rx')
hold on
plot(data1(:,1),data1(:,2),'bo')
contour(x1,x2,py1condx_logis,[0.5,0.5],'linewidth',1.5);
xlabel('x1')
xlabel('x2')