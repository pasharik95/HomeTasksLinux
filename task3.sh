#! /bin/bash
# The program allows you to divide
# two numbers with the required accuracy

# Showing header
echo "Calculation x / y :";

# Getting x, y 
echo -n "x = ";
read x;
echo -ne "\ny = ";
read y

# Cheking that 'y' is not equal to 0
if [[ "$y" == 0 ]]; then
	echo "Error!!! you can not do this operation!!!";
	exit 0;
fi

# Getting count of symbols after ','
echo -ne "\nt = ";
read t

# Function for getting the position
# of one string in another string 
# $1 - string $2 - substring
strindex()
{
  x="${1%%$2*}"
  [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

# Function for getting value of pow of ten
# for $1 will be integer
pow_of_ten()
{
	if [[ "$1" == *.* ]]; then
		STRLENGTH=${#1}; # length of $1
		echo $(($STRLENGTH-$(strindex $1 ".")-1));
	else
		echo 0;
	fi
}

# Function for conversion $1 to integer
# and multiply $1 on 10 $2 times
float_to_int()
{
	tmp=${1/./};
	i=$2

	while [ $i -gt 0 ];
	do
		tmp="${tmp}0";
		i=$(($i-1));
	done;
	if [[ $(strindex $tmp "0") == 0 ]]; then
               tmp="${tmp:1}"; 
        fi

	echo $(($tmp));
}

# Function for getting abs from $1
abs()
{
	[ $1 -lt 0 ] && echo $((-$1)) || echo $1;
}

# Function for division two integer numbers
div()
{
	tmp_x=$1;
	tmp_y=$2;

	res=$(($tmp_x/$tmp_y));
	tmp_x=$(abs $1);
	tmp_y=$(abs $2);

	tmp_x=$(($tmp_x-$(($tmp_y*$(abs $res)))));
	res="${res}.";

	while [ $t -gt 0 ];
	do
		tmp_x=$(($tmp_x*10));
		res="${res}"$(($tmp_x/$tmp_y));
		tmp_x=$(($tmp_x-$(($tmp_y*$(($tmp_x/$tmp_y))))));
		t=$(($t-1));
	done;
	echo $res;
}

# n_x - value of pow of 10 for x will be integer
# n_y - value of pow of 10 for y will be integer
n_x=$(pow_of_ten $x);
n_y=$(pow_of_ten $y)

# x to integer
# y to integer
x=$(float_to_int $x $(($n_y-$n_x)))
y=$(float_to_int $y $(($n_x-$n_y)))

# Show result
echo "res=$(div $x $y)";
