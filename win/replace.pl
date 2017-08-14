#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $s = '(lol)hello, please help me to clean this table, (smile). thank you!';
print "$s\n";$s =~ s/\([^\(\)]+\)//g;
print "$s\n";

print "Hello World!\n";
