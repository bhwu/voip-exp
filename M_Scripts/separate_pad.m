function [] = separate_pad(indices)
% ATTENTION: RUN NORMWAV.M FIRST
    for(i=indices)
        curr=importdata(['../wavFiles/',num2str(i),'.wav']);
        curr.data=[randn(curr.fs*2,1)*0.001;curr.data];
        audiowrite(['../wavFiles_pad/',num2str(i),'.wav'],curr.data,curr.fs);
    end
end

