min == "" {min=max=$1}
$1 < min  {min=$1}
$1 > max  {max=$1}
		  {sum+=$1; sumsq+=$1*$1}
END {
	print "lines: ", NR;
	print "min: ", min;
	print "max: ", max;
	print "sum: ", sum;
	print "mean: ", sum/NR;
	{second=(sum/NR)^2}
	print "stddev: ", sqrt(sumsq/NR - second)
}
