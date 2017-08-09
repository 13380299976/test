function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


for i = 1:K %最终要求哪个那个就在for循环最高层
    Ck = 0;
    for j = 1:m%对属于i的本求平均
    	if idx(j) == i;
        	Ck = Ck + 1;%计算个数用于求平均
            for k = 1:n
                centroids(i,:) = centroids(i,:) + X(j,:);%i类各个样本求和
            end 
        end
    end
    for k = 1:n
    	centroids(i,k) = centroids(i,k) / Ck;
    end
end








% =============================================================


end

