%% Evaluating the posterior
x = [-0.5, 1/3, 2/3]';
y = [0, 0.5, 0.5]';

gramMatrixXstarX = evaluateGramMatrix(covarianceFunction, theta, xStar, x);
gramMatrixXX = evaluateGramMatrix(covarianceFunction, theta, x, x);
gramMatrixXstarXstar = evaluateGramMatrix(covarianceFunction, theta, xStar, xStar);

meanPosterior = gramMatrixXstarX*inv(gramMatrixXX)*y;
covariancePosterior = gramMatrixXstarXstar - gramMatrixXstarX*inv(gramMatrixXX)*gramMatrixXstarX';

% Plotting mean, variance and sample of the posterior
% Plotting the variance of Prior
f = [meanPosterior+2*sqrt(diag(covariancePosterior)); flipdim(meanPosterior-2*sqrt(diag(covariancePosterior)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8)

% Plotting the mean of prior
hold on; plot(xStar, meanPosterior, 'k');

% Tip: add a jitter term to the gram matrix so that matrix inversion is numerically stable
jitter = 10^(-6);
L = chol(covariancePosterior + eye(N)*jitter);
randomFunction =meanPosterior  + L'*rand(N, 1);
hold on; plot(xStar, randomFunction, 'b');

% Plotting the data
hold on; plot(x, y, '*');