function [meanPosterior, gramMatrixPosterior] = evaluatePosterior(meanFunction, covarianceFunction, theta, x, xStar)

% Evaluating the mean vector
meanVector = meanFunction(xStar);

% Evaluating the neccesary matrices
gramMatrixXstarX = evaluateGramMatrix(covarianceFunction, theta, xStar, x);
gramMatrixXX = evaluateGramMatrix(covarianceFunction, theta, x, x);
gramMatrixXstarXstar = evaluateGramMatrix(covarianceFunction, theta, xStar, xStar);

+% Calculating the posterior mean and covariance
meanPosterior = meanVector + gramMatrixXstarX*(gramMatrixXX\y);
gramMatrixPosterior = gramMatrixXstarXstar - gramMatrixXstarX*(gramMatrixXX\gramMatrixXstarX');

end

%% Dataset D_1
x = [-0.5, 1/3, 2/3]';
y = [0, 0.5, 0.5]';
hold on; plot(x, y, '*');

[meanPosterior, gramMatrixPosterior] = evaluatePosterior(meanFunction, SEKernel, theta, x, y, xStar);
% Plotting the variance and mean of Posterior
hold on; plot(xStar, meanPosterior, 'k');
f = [meanPosterior+2*sqrt(diag(gramMatrixPosterior)); flipdim(meanPosterior-2*sqrt(diag(gramMatrixPosterior)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8)

% Plotting a randomly drawn sample 
[randomFunction] = drawRandomFunctions(meanPosterior, gramMatrixPosterior);
hold on; plot(xStar, randomFunction, 'b');
