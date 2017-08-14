#!/usr/bin/perl

# use 5.010;
use 5.14.2;
use strict;
use warnings;
use Array::Utils qw(:all);
use utf8;
use encoding 'utf8', STDOUT => 'gb2312';

sub getmovies
{
	open FH,'<:encoding(gb2312)',$_[0];
	my @a = map {/[\x{4e00}-\x{9fa5}]+/g} <FH>;
}

my @arr100 = getmovies 'C:\test\movie100.txt';
my @arr50 = getmovies 'C:\test\movie50.txt';

foreach(intersect(@arr100, @arr50))
{
	say $_;
}
print "Hello World!\n";
