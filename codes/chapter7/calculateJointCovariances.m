function [covy1y1, covf1f2, covf2f1, covf2f2] = calculateJointCovarianceFunctions(linearOperator)

% calculating the covariance functions using symbolic toolbox
[x1, x2, sn22, sn11, sf2, ell] = deal([]);
syms x1 x2 sn22 sn11 sf2 ell sqDist dist

% ell = exp(hyp1)
% sf2 = exp(2*hyp2)

latentk22 = sf2.*(exp(-0.5.*(x1-x2)^2/ell^2));
covf1f2 = linearOperator(latentk22, x1);
covf2f1 = linearOperator(latentk22, x2);
latentk11 = g(covf1f2, x2);

covf2f2 = latentk22 + sn22;
covy1y1 = latentk11 + sn11;

end

%%
% Integral Linear operator
L = @(y, x)  int(y, x, 0, x);
[covy1y1, covf1f2, covf2f1, covf2f2] = calculateJointCovarianceFunctions(L);