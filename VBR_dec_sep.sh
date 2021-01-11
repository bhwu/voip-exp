# Initialize: Clear existing files
if [ -f pesq_results.txt ]
then
	rm pesq_results.txt
fi

# Initialize loop over converted files
i=1
while [ $i -lt 201 ]
do
	#decode
	opusdec --quiet Opus_VBR/$i.opus tempDegrVBR.wav
	# Use PESQ reference code to evaluate the degraded version
	PESQ_Ref/source/PESQ +16000 +wb wavFiles/$i.wav tempDegrVBR.wav
	echo $i
	i=`expr $i + 1` #update counter
done

#Save pesq evaluations
awk 'NR>1{print $4}' pesq_results.txt > ShellScriptOut/PESQ_VBR.csv
#cleanup
rm temp*
rm pesq_results.txt


