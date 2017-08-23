clear 
clc
close all
%% Defining a Prior 
% Defining the mean function
meanFunction = @(x) 0*x; % zero mean function

% Defining a covariance function
covarianceFunction = @(theta, x1, x2) ...
                            (theta(1).^2*exp(-(x1 - x2)^2/(2*theta(2)^2))); % Standard exponential covariance function

%% Generating the toy Dataset 3
theta = [1, 0.1];
noiseHyp = 0.3;

nStar = 500;
xStar = linspace(-1, 1, nStar)';

kSENoiseFree = evaluateGramMatrix(covarianceFunction, theta, xStar, xStar);
kSENoisy = kSENoiseFree + exp(2*noiseHyp)*eye(nStar);

L = chol(kSENoisy);
ySE = L'*gpml_randn(0.2, nStar, 1);% + mu;% + exp(hyp.lik)*gpml_randn(0.2, n, 1);

% plot(xStar, ySE, '.')

%% Generating the approximate Gram matrix
nInducing = 20;
inducingPoints = linspace(-1, 1, nInducing);

approximateGramMatrix = evaluateNystromGramMatrix(covarianceFunction, theta, inducingPoints, xStar, xStar);


%% Distributed GP
idxRandom = randperm(nStar); % distributing the integers 1:500 randomly
numberOfExperts = 6; % number of experts
sizeOfExperts = floor(nStar/numberOfExperts); 

for i=1:numberOfExperts
    if i<numberOfExperts
        idxExpert{i} = idxRandom((i-1)*sizeOfExperts+1 : i*sizeOfExperts);
    elseif i==numberOfExperts
        idxExpert{i} = idxRandom((i-1)*sizeOfExperts+1 : nStar);
    end
end

theta = [1, 0.2, 0.1];
% xData = xStar; yData = ySE;
logMarginalLikelihoodDGP(theta, covarianceFunction, xData, yData, idxExpert)

