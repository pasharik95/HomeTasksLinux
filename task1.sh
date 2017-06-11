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

# copying files 
for i in {1..1000};
do
	# copying
	cp $DIR1'file'$i $DIR2;
done;
echo ;
 


