x1new(1) = 0;
x2new(1) = 38;
x1new(2) = 0;
x2new(2) = 61;
x1new(3) = 1;
x2new(3) = 38;
x1new(4) = 1;
x2new(4) = 61;
alpha=0.05;
figure(1)
plot(y,'b.')
hold on

type = ['ro';'r*';'rs';'rx'];

for i=1:4
phinew=[1, x1new(i), x2new(i), x1new(i).*x2new(i)];
ynew(i)=phinew*beta;

% prediction region 
%% find the ub and lb for ynew
interval=find_bound(ynew(i),y,alpha);
yub(i)=ynew(i)+interval;
ylb(i)=ynew(i)-interval;
% ub direction
yub(i) = bi_search_ub(yub(i),ynew(i), y, ynew(i),alpha);
% lb direction
ylb(i) = bi_search_lb(ynew(i),ylb(i), y, ynew(i),alpha);
h1 =plot(n+i*100,ynew(i),type(i,:),'linewidth',2);
h2 = plot(n+(i*100)*ones(10,1),linspace(ylb(i),yub(i),10),'b')

y= [y;ynew(i)];
x1=[x1;x1new(i)];
x2=[x2;x2new(i)];
PHI=[ones(n+i,1),x1,x2,x1.*x2];
beta=pinv(PHI)*y;
set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
end
xlabel('patients')
ylabel('blood pressure')
legend('past data', 'patient #1', 'patient #2', 'patient #3', 'patient #4')