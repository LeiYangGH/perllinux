﻿#!/usr/bin/perl

# use 5.010;
use 5.14.2;
use utf8;
use strict;
use warnings;



my $all = 'ab你好!c';


# say $gbstr;
$all =~ /\w+/;
my $en = $&;
say "\$en=$en";


my $ch = $&;
say "\$ch=$ch";


say "\x{D6D0}\x{CEC4}";
print "Hello World!\n";



