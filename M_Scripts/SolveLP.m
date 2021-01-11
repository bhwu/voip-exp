load('../Data/24VBR.mat');
xVals = unique(packSizes');
xProbs = zeros(1,length(xVals));
for(i = 1:length(xVals))
    xProbs(i) = sum(packSizes == xVals(i))/length(packSizes);
    disp(i);
end

figure(1);
constraintVals = log2(1:length(xVals));
cd ../../RSA_analysis/optimization/
[minPerfVals, statuses, pyx, times] = optNoise_v2(2, xVals, xProbs, constraintVals, 10000);
cd ../../voip-exp/Scripts
leak_LP=constraintVals;
cost_LP=minPerfVals;