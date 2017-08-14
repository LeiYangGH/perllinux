#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my @a1=(1,2,3);
my @a2=(4,5,6);
my @a3=(7,8,9);
my $ref=[\@a1, \@a2, \@a3];
my @arr = @{$ref->[0]};
say @arr;
# for my $s (@arr)
# {
	# say $s;	
# }

#print "@($ref->[0])\n";

open CITY,'<','cities.txt' or die 'cannot open\n';
my %h;
while(my $line = <CITY>)
{
	chomp($line);
	my($city,$country) =split(/,/,$line);
	my @cities;
	push @{$h{$country}},$city; 
	say $line;
}
say '-----------';
while (my ($k,$v) = each %h)
{
	say "$k,@{$v}";
}

print "Hello World!\n";
