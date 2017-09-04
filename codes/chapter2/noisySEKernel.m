function covariance = noisySEKernel(theta, x1, x2)
% theta(1): is the amplitude hyperparameter
% theta(2): is the length-scale hyperparameter
% theta(3): is the noise hyperparameter

if x1 == x2 % addition of white noise
    covariance = SEKernel(theta(1, 2), x1, x2) + theta(3)^2;
else % normal SE kernel
    covariance = SEKernel(theta(1, 2), x1, x2);
end

end