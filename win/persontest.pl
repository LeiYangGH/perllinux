#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use person;
#my $tom = person->new("Tom", "male");
my $tom = new person("Tom", "male");
my $kiss = person->new("Kiss", "female");
my @persons = ($tom, $kiss);
for my $p (@persons) 
{
printf("NAME: %s\tSEX: %s\n", $p->getName(), $p->getSex());
}
print "Hello World!\n";
