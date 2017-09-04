function [meanPosterior, gramMatrixPosterior] = evaluatePosterior(meanFunction, covarianceFunction, theta, x, y, xStar)

% Evaluating the mean vector
meanVector = meanFunction(xStar);

% Evaluating the neccesary matrices
gramMatrixXstarX = evaluateGramMatrix(covarianceFunction, theta, xStar, x);
gramMatrixXX = evaluateGramMatrix(covarianceFunction, theta, x, x);
gramMatrixXstarXstar = evaluateGramMatrix(covarianceFunction, theta, xStar, xStar);

% Calculating the posterior mean and covariance
meanPosterior = meanVector + gramMatrixXstarX*(gramMatrixXX\y);
gramMatrixPosterior = gramMatrixXstarXstar - gramMatrixXstarX*(gramMatrixXX\gramMatrixXstarX');

end