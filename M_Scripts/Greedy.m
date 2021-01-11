function [leak_GR, cost_GR] = Greedy(data)
cd ../../RSA_analysis/optimization/
[~, leak_GR, cost_GR, ~]=directSolve(data);
cd ../../voip-exp/M_Scripts
leak_GR=log2(leak_GR);