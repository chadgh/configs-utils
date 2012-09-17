#!/bin/bash
month=$1;
if [ "$month" == "" ]; then
	month="`date +%B | tr '[A-Z]' '[a-z]'`";
fi
echo "day words" > /tmp/words.dat;
for file in `ls Dropbox/projects/writing/2012/$month/`; do 
	day=`echo $file | cut -f1 -d'_'`;
	count=`wc -w ~/Dropbox/projects/writing/2012/$month/$file | cut -f1 -d' '`;
	if [ 0 -ne $count ]; then 
		echo "$day $count" >> /tmp/words.dat;
	fi
done;
R --no-save < ~/mybin/plotwords.r;
geeqie /tmp/words.png &
