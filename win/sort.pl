#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my @arr = qw(2 1 5 11 10 9);
for(sort @arr)
{
	print $_.' ';
}

say "\n----------";
for(sort {$a<=>$b}@arr)
{
	print $_.' ';
}

say "\n----------";

for(sort {$b cmp $a}@arr)
{
	print $_.' ';
}


say "\n----------";


print "Hello World!\n";
