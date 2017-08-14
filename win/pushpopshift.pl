#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my @arr = qw(a b c);
push @arr, 'd';
say join "\t", @arr;

pop @arr;
say join "\t", @arr;

unshift @arr, '0';
say join "\t", @arr;

shift @arr;
say join "\t", @arr;
print "Hello World!\n";
