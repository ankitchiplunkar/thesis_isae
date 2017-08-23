nStar = 500;
numberOfExperts = 6; % number of experts
sizeOfExperts = floor(nStar/numberOfExperts);

idxRandom = randperm(nStar); % distributing the integers 1:500 randomly

% Clustering points randomly into experts 
for i=1:numberOfExperts
    if i<numberOfExperts
        idxExpert{i} = idxRandom((i-1)*sizeOfExperts+1 : i*sizeOfExperts);
    elseif i==numberOfExperts
        idxExpert{i} = idxRandom((i-1)*sizeOfExperts+1 : nStar);
    end
end

% Points in the ith expert
xIthExpert = xData(idxExpert{i});
yIthExpert = yData(idxExpert{i});