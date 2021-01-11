#This shell script takes mp3 files from the ../CommonVoice/ directory and saves them in the wavFiles directory as .wav files

# First, extract the file names from the CommonVoice dataset. Save this in filenames
awk 'NR>1 {print($2)}' ../CommonVoice/validated.tsv > filenames

# Initialize loop over all listed files with a file index number
i=1
while IFS= read -r line
do # For each mp3 file from Commonvoice...
	# Convert it to .wav format and save it in wav format (force it to be 48000 kHz, the most common size in CommonVoice)
	command="mpg123 -q -r 48000 -w wavFiles/$i.wav ../CommonVoice/clips/$line.mp3"
	eval "$command"
	echo $i
	i=`expr $i + 1` #update counter
done <ShellScriptOut/filenames

