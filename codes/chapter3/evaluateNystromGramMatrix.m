% Function to evaluate the approximate gram matrix
function gramMatrix = evaluateNystromGramMatrix(covarianceFunction, theta, xm, x1, x2)

	gramMatrixX1M = evaluateGramMatrix(covarianceFunction, theta, x1, xm);
	gramMatrixMM = evaluateGramMatrix(covarianceFunction, theta, xm, xm);
	gramMatrixMX2 = evaluateGramMatrix(covarianceFunction, theta, xm, x2);

	gramMatrix = gramMatrixX1M*inv(gramMatrixMM)*gramMatrixMX2;
end
% Test points
nStar = 1000;
xStar = linspace(-1, 1, nStar);

% Inducing points
nInducing = 20;
inducingPoints = linspace(-1, 1, nInducing);

approximateGramMatrix = evaluateNystromGramMatrix(covarianceFunction, theta, inducingPoints, xStar, xStar);