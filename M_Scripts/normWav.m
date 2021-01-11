function [] = normWav(indices)
%Norms the volume of the wav files in ../wavFiles of the specified indices
    for(i=indices)
        curr=importdata(['../wavFiles/',num2str(i),'.wav']);
        curr.data=curr.data/max(abs(curr.data));
        audiowrite(['../wavFiles/',num2str(i),'.wav'],curr.data,curr.fs);
    end
end

