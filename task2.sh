#! /bin/bash
 
DIR1="tmp/1"; # directory for original files
DIR2="tmp/2"; # directory for copies of files
rows=$(tput lines); # height of window
cols=$(tput cols); # weight of window 

# string for to show sun while doing process of copy
sun="/-\|"

# creating directories
mkdir -p $DIR1;
mkdir -p $DIR2;

# creating 1000 files to DIR1 
for i in {1..1000};
do
	touch $DIR1'file'$i
done;

# cleaning window
clear;
# set cursor in start position of progress bar  
tput cup $(($rows-1)) 5;
echo -n '[';
# set cursor in end possition of progress bar 
tput cup $(($rows-1)) $(($cols-12));
echo -n ']';

j=0 # index of sun string
# copying files 
for i in {1..1000};
do
	# copying
	cp $DIR1'file'$i $DIR2;
	sleep .005; 
	tput cup $(($rows-1)) $((6+$(($i*$(($cols-19))))/1000 | bc));
	echo -n '#';
	tput cup $(($rows-1)) $(($cols-10));
	echo -ne $i'/1000';
	# printing symbol from sun when 10 files was copied
	if [[ $(($i%10)) == "0" ]]; then
		tput cup $(($rows-1)) 1;
		echo -n "${sun:$j%4:1}";
		j=$(($j+1));
	fi;
done;
echo ;
 


