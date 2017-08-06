function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);%number of centroids = K

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%第一个for标记所有Xi，第二个for计算Xi到centroid_1的欧氏距离means，第三个for标记Xi的第2~K个centroid
%第四个for计算Xi与第2~K个centroid的欧式距离temp，比上一个小便更新means和index
for i = 1:size(X,1) %num of X
   means = 0;
   for k = 1:size(X,2) %num of features of X
        means = means + (X(i,k) - centroids(1,k))^2;%initial_centroids = [3 3; 6 2; 8 5]，求Xi到（3，3）的欧氏距离
   end
   id = 1;%初始化index 为 1
   for j = 2: K %注意是大写K，number of centroids = K，求到其他centroids的距离，更新index
       temp = 0;
       for k = 1:size(X,2)
            temp = temp + (X(i,k) - centroids(j,k))^2;
       end
       if temp <= means
           means = temp; 
           id = j; %因为for循环里比较欧氏距离+更新index，所以要先写一个初始的index
       end
   end
   idx(i) = id;
end







% =============================================================

end

