% Function to evaluate the gram matrix
function gramMatrix = evaluateGramMatrix(covarianceFunction, theta, x1, x2)

    [X1, X2] = meshgrid(x1, x2);
    % evaluating element wise gram matrix
    gramMatrix = covarianceFunction(theta, X1, X2);

end

% Initial parameters
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

theta(1) = 1; % Amplitude Hyper-parameter
theta(2) = 0.2; % Length Scale Hyper-parameter

% Visualizing the Gram matrix
gramMatrix = evaluateGramMatrix(SEKernel, theta, xStar, xStar);
imagesc(gramMatrix); % Plotting the Gram Matrix

                        





