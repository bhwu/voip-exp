if [ -f pesq_results.txt ]
then
	rm pesq_results.txt
fi

#Encode combined padded wav file
opusenc wavFiles_comb/combined_pad.wav Opus_VBR/combined_pad.opus --bitrate 24 --hard-cbr --quiet
#Decode
opusdec --quiet Opus_VBR/combined_pad.opus tempDegrCBR.wav
# Use PESQ reference code to evaluate the VBR and CBR degraded versions
PESQ_Ref/source/PESQ +16000 +wb wavFiles_comb/combined_pad.wav tempDegrCBR.wav


rm temp*
