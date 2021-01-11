flipped=fliplr(cbrPesq-repmat(vbrPesq,1,91));
guarBetter = zeros(1,length(vbrPesq));
for(i=1:length(vbrPesq))
    guarBetter(i)=100-find(flipped(i,:)<0,1)+1;
end