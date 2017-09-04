clear 
clc
close all
%% Defining a Prior 
% Defining the mean function
meanFunction = @(x) 0*x; % zero mean function

% Defining a covariance function
SEKernel = @(theta, x1, x2)(theta(1).^2*exp(-(x1 - x2).^2/(2*theta(2).^2))); 

theta = [1, 0.2];
                        
%% Plotting the Gram Matrix
% Initial parameters
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

theta(1) = 1; % Amplitude Hyper-parameter
theta(2) = 0.2; % Length Scale Hyper-parameter

% Visualizing the Gram matrix
gramMatrix = evaluateGramMatrix(SEKernel, theta, xStar, xStar);
imagesc(gramMatrix); % Plotting the Gram Matrix

%% Sampling functions from the Prior

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

%% Observed data
x = [-0.5, 1/3, 2/3]';
y = [0, 0.5, 0.5]';

[meanPosterior, gramMatrixPosterior] = evaluatePosterior(meanFunction, SEKernel, theta, x, y, xStar);

% Plotting mean, variance and sample of the posterior
% Plotting the variance of Prior
f = [meanPosterior+2*sqrt(diag(gramMatrixPosterior)); flipdim(meanPosterior-2*sqrt(diag(gramMatrixPosterior)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8)

% Plotting the mean of prior
hold on; plot(xStar, meanPosterior, 'k');

% Plotting the data
hold on; plot(x, y, '*');

%% Optimizing hyper parameters
% Definition of dataset D2
f = @(x)sin(5*pi*x)./(5*pi*x);
noise = 0.1;
nData = 20;
xData = linspace(-1, 1, nData)';
yData = f(xData) + noise*2*rand(nData, 1);

theta = [1, 0.2];
% Amplitude hyp = 1
% Length Scale = 0.2
% Noise  = 0.1

clear x
options = optimoptions('fminunc','GradObj','off', 'MaxIter', 100); % indicate gradient is provided 
optimizedTheta = fminunc(@(x) -1*logMarginalLikelihood(x, SEKernel, xData, yData), theta, options);
