%% Defining a Prior 
% Defining the mean function
meanFunction = @(x) 0; % zero mean function

% Defining a covariance function
covarianceFunction = @(amplitude, lengthScale, x1, x2) ...
                            (amplitude.^2*exp(-(x1 - x2)^2/(2*lengthScale^2))); % Standard exponential covariance function
hypAmplitude = 1; % Amplitude Hyper-parameter
hypLengthScale = 0.2; % Length Scale Hyper-parameter
                        
%% Plotting the Gram Matrix
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

meanVector = meanFunction(xStar);

for i=1:N
    for j=1:N
        gramMatrix(i, j) = covarianceFunction(hypAmplitude, hypLengthScale, xStar(i), xStar(j));
    end
end

% Visualizing the Gram matrix
imagesc(gramMatrix);

%% Sampling functions from the Prior

% Tip: add a jitter term to the gram matrix so that matrix inversion is numerically stable
jitter = 10^(-6); 

% The cholesky decomposition
L = chol(gramMatrix + eye(N)*jitter);

randomFunction = meanVector + L'*rand(N, 1);

plot(xStar, randomFunction, 'k');
