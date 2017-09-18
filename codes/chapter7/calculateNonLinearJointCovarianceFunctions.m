function [covy1y1, covf1f2, covf2f1, covy2y2] = calculateNonLinearJointCovarianceFunctions(jacobianOfOperator)

% calculating the covariance functions using symbolic toolbox
[x1, x2, sn22, sn11, sf2, ell] = deal([]);
syms x1 x2 sn22 sn11 sf2 ell sqDist dist

latentk22 = sf2.*(exp(-0.5.*(x1-x2)^2/ell^2));
covf1f2 = jacobianOfOperator(x1).*(latentk22);
covf2f1 = jacobianOfOperator(x2).*(latentk22);
latentk11 = jacobianOfOperator(x2).^2.*(latentk22);

% adding noise
covy2y2 = latentk22 + sn22;
covy1y1 = latentk11 + sn11;

end