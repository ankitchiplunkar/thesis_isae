% Function to evaluate the gram matrix
function gramMatrix = evaluateGramMatrix(covarianceFunction, theta, x1, x2)

	for i=1:length(x1)
		for j=1:length(x2)
			gramMatrix(i, j) = covarianceFunction(theta, x1(i), x2(j));
		end
	end	

end

% Initial parameters
N = 100; % Number of testing points
xStar = linspace(-1, 1, N)'; % Input training points

theta(1) = 1; % Amplitude Hyper-parameter
theta(2) = 0.2; % Length Scale Hyper-parameter

% Visualizing the Gram matrix
gramMatrix = evaluateGramMatrix(covarianceFunction, theta, xStar, xStar);
imagesc(gramMatrix); % Plotting the Gram Matrix

                        





