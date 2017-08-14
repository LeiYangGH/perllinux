#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
my @all = grep {-d and /mysql/} glob( '/home/wwwroot/default/*');
foreach(@all)
{
	say $_;
	unlink $_;
}
say "Done!";
