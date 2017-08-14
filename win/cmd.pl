#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
my $f = 'c:\test\test.txt';`"notepad $f"`;
#等效于：
#`notepad c:\\test\\test.txt`;
print "Hello World!\n";
