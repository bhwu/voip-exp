# Initialize: Clear existing files
if [ -f ShellScriptOut/PS_VBR_comb.csv ]
then
	rm ShellScriptOut/PS_VBR_comb.csv
fi

#Encode combined unpadded wav file
opusenc wavFiles_comb/combined.wav Opus_VBR/combined.opus --bitrate 24 --save-range tempEncDump --quiet
#Extract packet sizes
awk '{print(substr($2, 1, length($2)-1))}' tempEncDump >> ShellScriptOut/PS_VBR_comb.csv

#Decode
opusdec --quiet Opus_VBR/combined.opus tempDegrVBR.wav
#Use PESQ reference code to evaluate the degraded version
PESQ_Ref/source/PESQ +16000 +wb wavFiles_comb/combined.wav tempDegrVBR.wav

rm temp*


