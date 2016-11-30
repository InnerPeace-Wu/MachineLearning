clear all;
clc;
addpath(genpath('DeepLearnToolbox'));
load mnist_uint8;
test_x = reshape(test_x',28,28,10000);
nntest_x = zeros(10000,400);
%nntest_y = zeros(10000,1);

for i = 1:10000
%     [dummy, p] = max(test_y(i,:), [], 2);
%     if (p == 1)
%         nntest_y(i,:) = 10;
%     else
%         nntest_y(i,:) = p-1;
%     end
   reimg = imresize(test_x(:,:,i)',[20 20]);
   reimg = double(reimg)/255;
   nntest_x(i,:)=reimg(:);
   if (i < 5)
    figure;
    imshow(test_x(:,:,i)');
    figure;
    imshow(reshape(nntest_x(i,:),20,20));
   end
end
%save nntest_x nntest_x;
%save nntrain_x nntrain_x;
%t = train_x(:,:,5)';
%reimg = imresize(train_x(:,:,5)',[20 20]);
%reimg = reimg';
%imginone = reimg(:);
%imt = reshape(imginone,20,20,1);
% figure;
% imshow(imt);