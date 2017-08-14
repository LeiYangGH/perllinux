#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Array::Utils qw(:all);
my @a = qw( a b c d );
my @b = qw( c d e f );

my @isect = intersect(@a, @b);
print join(",",@isect) . "\n";
print "Hello World!\n";
