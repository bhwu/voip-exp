if [ -f pesq_results.txt ]
then
	rm pesq_results.txt
fi

i=1
while [ $i -le 200 ] # Loop over padded wav files
do
	filename="$i.wav"
	j=10
	while [ $j -le 100 ] # Loop over bitrates
	do
		opusenc wavFiles_pad/$filename Opus_VBR/$i.opus --bitrate $j --hard-cbr --quiet
		opusdec --quiet Opus_VBR/$i.opus tempDegrCBR.wav
		PESQ_Ref/source/PESQ +16000 +wb wavFiles_pad/$filename tempDegrCBR.wav
		j=$(( j+1 ))
	done
	i=$(( i+1 ))
done
awk 'NR>1{print $4}' pesq_results.txt > CBR_pesq_sweep.csv

rm temp*
