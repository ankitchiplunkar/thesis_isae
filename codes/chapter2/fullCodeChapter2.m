clear 
clc
close all
%% Defining a Prior 
% Defining the mean function
meanFunction = @(x) 0*x; % zero mean function

% Defining a covariance function
covarianceFunction = @(theta, x1, x2) ...
                            (theta(1).^2*exp(-(x1 - x2)^2/(2*theta(2)^2))); % Standard exponential covariance function
theta = [1, 0.2];
                        
%% Plotting the Gram Matrix
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

meanVector = meanFunction(xStar);

for i=1:N
    for j=1:N
        gramMatrix(i, j) = covarianceFunction(theta, xStar(i), xStar(j));
    end
end

% Visualizing the Gram matrix
imagesc(gramMatrix);

%% Sampling functions from the Prior

% Plotting the variance of Prior
f = [meanVector+2*sqrt(diag(gramMatrix)); flipdim(meanVector-2*sqrt(diag(gramMatrix)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8)

% Plotting the mean of prior
hold on; plot(xStar, meanVector, 'k');

% Tip: add a jitter term to the gram matrix so that matrix inversion is numerically stable
jitter = 10^(-6); 

% The cholesky decomposition
L = chol(gramMatrix + eye(N)*jitter);
randomFunction = meanVector + L'*rand(N, 1);

hold on; plot(xStar, randomFunction, 'b');

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

%% Optimizing hyper parameters
% Definition of dataset D2
f = @(x)sin(5*pi*x)./(5*pi*x);
noise = 0.1;
nData = 20;
xData = linspace(-1, 1, nData)';
yData = f(xData) + noise*2*rand(nData, 1);

theta = [1, 0.2, 0.1];
% Amplitude hyp = 1
% Length Scale = 0.2
% Noise  = 0.1

options = optimoptions('fminunc','GradObj','off', 'MaxIter', 100); % indicate gradient is provided 
optimizedTheta = fminunc(@(x) -1*logMarginalLikelihood(x, covarianceFunction, xData, yData), theta, options);
