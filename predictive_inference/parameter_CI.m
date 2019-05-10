calpha = chi2inv(0.95,length(beta));
C = (1/n*PHI'*PHI)^-1.* (1/n*(y-PHI*beta)'*(y-PHI*beta));
beta2ub = beta(2)+ sqrt(calpha*C(2,2)/n);
beta2lb = beta(2)-sqrt(calpha*C(2,2)/n);
beta3ub = beta(3)+ sqrt(calpha*C(3,3)/n);
beta3lb = beta(3)-sqrt(calpha*C(3,3)/n);