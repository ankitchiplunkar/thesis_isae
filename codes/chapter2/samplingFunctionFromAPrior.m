function [randomFunction] = drawRandomFunctions(meanVector, gramMatrix)

N = length(meanVector);

% Tip: add a jitter term to the gram matrix so that matrix inversion is numerically stable
jitter = 10^(-6);
% The cholesky decomposition
L = chol(gramMatrix + eye(N)*jitter);

randomFunction = meanVector + L'*rand(N, 1);

end

% Initial parameters
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

theta(1) = 1; % Amplitude Hyper-parameter
theta(2) = 0.2; % Length Scale Hyper-parameter

% Plotting the mean of prior
meanVector = meanFunction(xStar);
hold on; plot(xStar, meanVector, 'k');

% Plotting the variance of Prior
gramMatrix = evaluateGramMatrix(SEKernel, theta, xStar, xStar);
f = [meanVector+2*sqrt(diag(gramMatrix)); flipdim(meanVector-2*sqrt(diag(gramMatrix)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8);

% Plotting the randomly drawn sample function
[randomFunction] = drawRandomFunctions(meanVector, gramMatrix);
hold on; plot(xStar, randomFunction, 'b');