# Initialize: Clear existing files
if [ -f ShellScriptOut/PS_VBR_sep_pad.csv ]
then
	rm ShellScriptOut/PS_VBR_sep_pad.csv
fi

# Initialize loop over converted files
i=1
while [ $i -le 200 ]
do
	filename="$i.wav"
	# Encode padded separate .wav files
	opusenc wavFiles_pad/$filename Opus_VBR/$i.opus --bitrate 24 --save-range tempEncDump --quiet
	# Extract packet sizes
	awk '{print(substr($2, 1, length($2)-1))}' tempEncDump >> ShellScriptOut/PS_VBR_sep_pad.csv
	echo $i	
	i=`expr $i + 1` #update counter	
done

rm temp*


