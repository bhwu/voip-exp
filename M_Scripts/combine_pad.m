function [] = combine_pad(indices)
%Takes wav files in the directory ../wavFiles, normalizes their volume, and
%combines them into a single audio file 'audioOut.wav'
%Accepts 'indices', a list of file numbers
% ATTENTION: RUN NORMWAV.M FIRST
    data=[];
    for(i=indices)
        curr=importdata(['../wavFiles/',num2str(i),'.wav']);
        data=[data;randn(curr.fs*2,1)*0.001;curr.data];
    end
    audiowrite('../wavFiles_comb/combined_pad.wav',data,curr.fs);
end

