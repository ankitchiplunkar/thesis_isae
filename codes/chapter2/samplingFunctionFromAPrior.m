meanVector = meanFunction(xStar);

% Plotting the variance of Prior
f = [meanVector+2*sqrt(diag(gramMatrix)); flipdim(meanVector-2*sqrt(diag(gramMatrix)),1)];
hold on; fill([xStar; flipdim(xStar,1)], f, [7 7 7]/8)

% Plotting the mean of prior
hold on; plot(xStar, meanVector, 'k');

% Tip: add a jitter term to the gram matrix so that matrix inversion is numerically stable
jitter = 10^(-6);
 
% The cholesky decomposition
L = chol(gramMatrix + eye(N)*jitter);

% Plotting the randomly drawn sample function
randomFunction = meanVector + L'*rand(N, 1);
hold on; plot(xStar, randomFunction, 'b');