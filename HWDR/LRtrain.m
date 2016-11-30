%% Initialization
clear ; close all; clc

addpath(genpath('LogisticRegression'));

lambda = 0.1;

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)
% Load Training Data
fprintf('Loading Data ...\n')

 % training data stored in arrays X, y
load('nntrain_x.mat');
load('nntrain_y.mat');
X = nntrain_x;
y = nntrain_y;
m = size(X, 1);

fprintf('\nTraining One-vs-All Logistic Regression with lambda= %f\n', lambda);


[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Saving trained theta...\n');
save lr_theta.mat all_theta;

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
%  After ...
pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
load('nntest_x.mat');
load('nntest_y.mat');

pred = predictOneVsAll(all_theta, nntest_x);

fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == nntest_y)) * 100);