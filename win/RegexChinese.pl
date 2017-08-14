#!/usr/bin/perl

# use 5.010;
use 5.14.2;
use utf8;
use strict;
use warnings;

say "\x{263A}";

my $all = 'ab你好!c';

# my $gbstr = Encode::decode("gb2312", $all);
# say $gbstr;say "\$all=$all";
$all =~ /\w+/;
my $en = $&;
say "\$en=$en";

$all =~ /[^\w]/;
my $ch = $&;
say "\$ch=$ch";

# say "\x{D6}\x{D0}\x{CE}\x{C4}";
say "\x{D6D0}\x{CEC4}";
print "Hello World!\n";

<>;

<>;