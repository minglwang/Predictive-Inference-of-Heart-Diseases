
function guass2dplot(x1, x2, mu, Sigma,r)
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)], mu, Sigma);
F = reshape(F,length(x2),length(x1));
contour(x1,x2,F,r,'linewidth',1);
end