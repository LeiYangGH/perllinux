#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
# my @a = qw(a b c);
# print @a;
my $cmd = 'my @a = qq(a b c); print @a;';
eval($cmd);
print "Hello World!\n";
