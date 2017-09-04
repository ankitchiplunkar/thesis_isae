function gramMatrix = evaluateGramMatrix(covarianceFunction, theta, x1, x2)

    [X1, X2] = meshgrid(x2, x1);
    % evaluating element wise gram matrix
    gramMatrix = covarianceFunction(theta, X1, X2);

end