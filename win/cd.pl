#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
sub listfiles
{
	my @a = glob( '*');
	say join "\n", @a;
}
listfiles();

say 'cd ..';

listfiles();


print "Hello World!\n";