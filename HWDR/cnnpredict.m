function p = cnnpredict(X)
load ccn_trained;

cnn = cnnff(cnn, x);
[maxt,p] = max(cnn.o, [], 1);

p = p.-1;
end