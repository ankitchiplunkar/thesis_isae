function logMarginalLikelihoodDGP = logMarginalLikelihoodDGP(theta, covarianceFunction, x, y, idxExpert)

	numberOfExperts = length(idxExpert);

	% Adding log marginal likelihoods of independent experts
	logMarginalLikelihoodDGP = 0;
	for i =1:numberOfExperts 
		% Points in the iTH expert
		xOfIthExpert = x(idxExpert{i}); 
		yOfIthExpert = y(idxExpert{i}); 
    
		logMarginalLikelihoodDGP = logMarginalLikelihoodDGP + ...
                            logMarginalLikelihood(theta, covarianceFunction, xOfIthExpert, yOfIthExpert);
	end

end

% Hyper parameters
noiseHyp = 0.1;
theta = [1, 0.2, noiseTerm];

logMarginalLikelihoodDGP(theta, covarianceFunction, xData, yData, idxExpert)