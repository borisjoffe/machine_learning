function [train, test, trainIdxs, testIdxs] = splitData(data, pctTrain)
% Splits data into a training set and a test set
% - data should be a matrix of features in columns (and samples in rows) except for the last column which should be the target vector
% - pctTrain should be the pct of samples to use for training (default is 0.5)
% - returns the matrix split into a training matrix, test matrix, a vector of indices of the training set, and a vector of indices for the test set

m = size(data, 1);  % number of training samples

if m < 6
	display('Error: Please use more than 6 training samples');
	return
end

if nargin == 1
	% default to half the data set for training
	pctTrain = 0.5
end

numTrain  = floor(pctTrain * m);
trainIdxs = randperm(m, numTrain);   % select random indexes for training
testIdxs  = setdiff(1:m, trainIdxs); % get complement

if length(trainIdxs) < 3
	display('Error: Please specify a larger pctTrain so that we have at least 3 training samples');
	return
end

if length(testIdxs) < 3
	display('Error: Please specify a lower pctTrain so that we have at least 3 test samples');
	return
end

train = data(trainIdxs, :);
test  = data(testIdxs, :);

display(['Using ', int2str(length(trainIdxs)), ' samples to train and ', int2str(length(testIdxs)), ' to test']);
end
