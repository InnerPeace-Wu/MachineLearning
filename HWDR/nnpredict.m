function p = nnpredict(X)
%Maybe load theta before.
if ~exist('Theta1','file') || ~exist('Theta2','file')
    printf("Loading trained data...\n");
    load nnTheta1.mat;
    load nnTheta2.mat;
end
% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);

end