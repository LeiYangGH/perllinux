#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Digest::MD5 qw(md5 md5_hex md5_base64);
 
 
open FILE, "cities.txt";
binmode FILE;
my $data = <FILE>;
close FILE;
my $hash = md5($data);
# say $digest;
# say $hash; #expected:25 .. 4A
 printf ("0x%lX ", ord $hash);
print "Hello World!\n";
