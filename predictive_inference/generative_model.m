function [py0condx,py1condx]=generative_model(mu0,Sigma0,mu1,Sigma1, x1, x2, py0, py1)
 [X1,X2] = meshgrid(x1,x2);
 pxcondy0 = mvnpdf([X1(:) X2(:)], mu0, Sigma0);
 pxcondy1 = mvnpdf([X1(:) X2(:)], mu1, Sigma1);
 px=pxcondy0*py0+pxcondy1*py1;
 py0condx = pxcondy0*py0./px;
 py1condx = 1-py0condx;
 py0condx = reshape(py0condx,length(x2),length(x1));
 py1condx = reshape(py1condx,length(x2),length(x1));
end
% [n1,n2]=size(x1);
% n=length(x1);
% for i=1:n
%     for j=1: n
% pxcondy0 = 1/(sqrt(2*pi)*det(sigma0))*exp(-.5*(x1(i)-mu0)*sigma0^(-1)*(x2(i)-mu0)');
% pxcondy1 = 1/(sqrt(2*pi)*det(sigma1))*exp(-.5*(x1(i)-mu1)*sigma1^(-1)*(x2(i)-mu1)');
% px = 1/(sqrt(2*pi)*det(sigma0))*exp(-.5*(x1(i)-mu0)*sigma0^(-1)*(x2(i)-mu0)')*py0+...
%       1/(sqrt(2*pi)*det(sigma1))*exp(-.5*(x1(i)-mu1)*sigma1^(-1)*(x2(i)-mu1)')*py1;
% py0condx(i,j) = pxcondy0*py0/px;
% py1condx(i) = 1-py0condx;
%     end
% end
% py0condx=reshape(py0condx,n1,n2);
% py1condx=reshape(py1condx,n1,n2);