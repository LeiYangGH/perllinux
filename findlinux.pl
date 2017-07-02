#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use File::Path;
use File::Glob ':glob';
use File::Basename;
use File::Spec::Functions 'catfile';
 use File::Find qw(finddepth);

my $testdir = 'C:/test';
 # my $cdir = 'C:/G/CConsole/CStu';
my $cdir = '/';
my @files;

finddepth(sub 
{
      return if($_ eq '.' || $_ eq '..');
      push @files, $File::Find::name;
}, $cdir);
for my $f (@files)
{
        if(!-d $f &&  $f =~ /python/)
        { 
		
		   
		      say "-------------$f";
	}
	}
	
     

print "Hello World!\n";
