#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my $op = [
sub
{
	my($a,$b)=@_;
	$a + $b;
},
sub
{
	my($a,$b)=@_;
	$a - $b;
},
sub
{
	my($a,$b)=@_;
	$a * $b;
},
sub
{
	my($a,$b)=@_;
	$a / $b;
}
];
for my $i (1..6)
{
	my $add = $op->[rand(4)];
	my $r = &$add(2,3);
	say $r;
}
print "Hello World!\n";
